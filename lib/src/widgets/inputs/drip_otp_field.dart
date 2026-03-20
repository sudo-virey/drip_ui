import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/drip_theme.dart';

class DripOTPField extends StatefulWidget {
  final int length;
  final Function(String)? onCompleted;

  const DripOTPField({
    super.key,
    this.length = 4,
    this.onCompleted,
  });

  @override
  State<DripOTPField> createState() => _DripOTPFieldState();
}

class _DripOTPFieldState extends State<DripOTPField> {
  // Definimos los controladores y nodos de foco como parte del Estado
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    // Se inicializan una sola vez al crear el widget
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    // Limpieza profesional de recursos
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final drip = Theme.of(context).extension<DripTheme>() ?? DripTheme.dark();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: widget.length > 4 ? 45 : 60,
          // Usamos TapRegion aquí también para que sea consistente
          child: TapRegion(
            onTapOutside: (_) => _focusNodes[index].unfocus(),
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: drip.primaryColor, 
                fontSize: 24, 
                fontWeight: FontWeight.bold
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                filled: true,
                fillColor: drip.inputBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: drip.primaryColor, width: 2),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (index < widget.length - 1) {
                    _focusNodes[index + 1].requestFocus();
                  } else {
                    _focusNodes[index].unfocus();
                    String code = _controllers.map((c) => c.text).join();
                    if (widget.onCompleted != null) widget.onCompleted!(code);
                  }
                } else if (value.isEmpty && index > 0) {
                  _focusNodes[index - 1].requestFocus();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}