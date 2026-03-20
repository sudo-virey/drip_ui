import 'package:flutter/material.dart';
import '../../core/drip_colors.dart';

enum DripButtonVariant { primary, secondary, ghost }

class DripButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final DripButtonVariant variant;
  final Color? color;

  const DripButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = DripButtonVariant.primary,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Toma todo el ancho como en tus diseños
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? (variant == DripButtonVariant.primary ? DripColors.lime : Colors.transparent),
          foregroundColor: variant == DripButtonVariant.primary ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Estilo "pill" de tus capturas
            side: variant == DripButtonVariant.ghost ? const BorderSide(color: DripColors.lime) : BorderSide.none,
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}