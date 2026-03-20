import 'package:flutter/material.dart';
import 'drip_text_field.dart';
import '../../core/drip_theme.dart';

class DripSearchField extends StatefulWidget {
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const DripSearchField({
    super.key,
    this.label = "Search",
    this.hintText = "Search for something...",
    this.onChanged,
    this.controller,
  });

  @override
  State<DripSearchField> createState() => _DripSearchFieldState();
}

class _DripSearchFieldState extends State<DripSearchField> {
  late TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final drip = Theme.of(context).extension<DripTheme>() ?? DripTheme.dark();

    return DripTextField(
      label: widget.label,
      hintText: widget.hintText,
      prefixIcon: Icons.search,
      controller: _internalController,
      onChanged: (value) {
        setState(() {}); // Actualiza para mostrar/ocultar la "X"
        if (widget.onChanged != null) widget.onChanged!(value);
      },
    );
  }
}