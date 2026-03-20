import 'package:flutter/material.dart';
import 'drip_text_field.dart';

class DripMultilineField extends StatelessWidget {
  final String label;
  final String hintText;
  final int maxLines;
  final TextEditingController? controller;

  const DripMultilineField({
    super.key,
    required this.label,
    this.hintText = "Tell us more...",
    this.maxLines = 4,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DripTextField(
      label: label,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.multiline,
      // Nota: En DripTextField base deberías habilitar maxLines: null 
      // o pasarle este parámetro para que funcione el scroll interno.
    );
  }
}