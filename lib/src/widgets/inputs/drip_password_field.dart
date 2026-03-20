import 'package:flutter/material.dart';
import 'drip_text_field.dart';

class DripPasswordField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const DripPasswordField({super.key, this.label = "Password", this.controller});

  @override
  Widget build(BuildContext context) {
    return DripTextField(
      label: label,
      hintText: "••••••••",
      isPassword: true,
      prefixIcon: Icons.lock_outline,
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter your password';
        if (value.length < 8) return 'Min. 8 characters';
        return null;
      },
    );
  }
}