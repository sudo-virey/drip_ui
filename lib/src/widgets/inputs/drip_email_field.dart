import 'package:flutter/material.dart';
import 'drip_text_field.dart';

class DripEmailField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  
  const DripEmailField({super.key, this.label = 'Email Address', this.controller});

  @override
  Widget build(BuildContext context) {
    return DripTextField(
      label: label,
      hintText: 'example@mail.com',
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Email is required';
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value)) return 'Invalid email format';
        return null;
      },
    );
  }
}