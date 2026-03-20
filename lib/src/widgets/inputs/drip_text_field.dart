import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/drip_theme.dart';

class DripTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final bool isPassword;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction; // Nuevo: Controla el botón del teclado

  const DripTextField({
    super.key,
    required this.label,
    this.hintText,
    this.isPassword = false,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.textInputAction,
  });

  @override
  State<DripTextField> createState() => _DripTextFieldState();
}

class _DripTextFieldState extends State<DripTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final drip = Theme.of(context).extension<DripTheme>() ?? DripTheme.dark();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TapRegion(
      onTapOutside: (_) => FocusScope.of(context).unfocus(), // Cierra al tocar fuera
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label.toUpperCase(),
            style: TextStyle(color: drip.labelColor, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscureText : false,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction ?? TextInputAction.done, // 'Hecho' por defecto
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(), // Cierra al dar 'Enter'
            style: TextStyle(color: isDark ? Colors.white : Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: drip.inputBackground,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: drip.labelColor.withOpacity(0.5)),
              prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, color: drip.labelColor) : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: drip.labelColor),
                      onPressed: () => setState(() => _obscureText = !_obscureText),
                    )
                  : null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: drip.primaryColor.withOpacity(0.5), width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}