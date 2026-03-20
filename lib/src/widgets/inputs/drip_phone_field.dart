import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'drip_text_field.dart';

class DripPhoneField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final int maxLength;

  const DripPhoneField({
    super.key, 
    this.label = 'Phone Number', 
    this.hintText = '+0 000 000 000',  
    this.controller,
    this.maxLength = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DripTextField(
          label: label,
          hintText: hintText,
          prefixIcon: Icons.phone_android_outlined,
          keyboardType: TextInputType.phone,
          controller: controller,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(maxLength), // Capa de seguridad física
          ],
          onChanged: (value) {
            // Si llega al límite, cerramos automáticamente
            if (value.length >= maxLength) {
              FocusScope.of(context).unfocus();
            }
          },
        ),
      ],
    );
  }
}