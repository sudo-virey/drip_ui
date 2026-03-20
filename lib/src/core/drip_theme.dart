// lib/src/core/drip_theme.dart

import 'package:flutter/material.dart';
import 'drip_colors.dart';

class DripTheme extends ThemeExtension<DripTheme> {
  final Color primaryColor;
  final Color inputBackground;
  final Color labelColor;

  const DripTheme({
    required this.primaryColor,
    required this.inputBackground,
    required this.labelColor,
  });

  // --- MODO OSCURO (Default Drip) ---
  factory DripTheme.dark() => const DripTheme(
        primaryColor: DripColors.lime,
        inputBackground: DripColors.darkInput,
        labelColor: DripColors.greyText,
      );

  // --- MODO CLARO ---
  factory DripTheme.light() => const DripTheme(
        primaryColor: Color(0xFF4CAF50), // Un verde más sólido para fondo blanco
        inputBackground: Color(0xFFF5F5F5), // Gris muy clarito
        labelColor: Color(0xFF616161),
      );

  @override
  DripTheme copyWith({Color? primary, Color? input, Color? label}) {
    return DripTheme(
      primaryColor: primary ?? primaryColor,
      inputBackground: input ?? inputBackground,
      labelColor: label ?? labelColor,
    );
  }

  @override
  DripTheme lerp(ThemeExtension<DripTheme>? other, double t) {
    if (other is! DripTheme) return this;
    return DripTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      inputBackground: Color.lerp(inputBackground, other.inputBackground, t)!,
      labelColor: Color.lerp(labelColor, other.labelColor, t)!,
    );
  }
}