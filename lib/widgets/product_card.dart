import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback? onTap;
  final Color? iconColor;

  const ProductCard({
    super.key,
    required this.label,
    required this.icon,
    required this.gradient,
    this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // debug: ProductCard $label clicado!
        onTap?.call();
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF181818),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return gradient.createShader(bounds);
              },
              child: Icon(icon, size: 48, color: iconColor ?? Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
