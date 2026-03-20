import 'package:flutter/material.dart';

class DripLogoContainer extends StatelessWidget {
  final double size;

  const DripLogoContainer({
    super.key,
    this.size = 120.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(color: Colors.white24, width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipOval(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(
            'assets/drip_logo.png', // Tu imagen subida
            package: 'drip_ui',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}