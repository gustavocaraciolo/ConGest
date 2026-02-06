import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  final Widget child;
  final Color color;
  final double size;
  final double borderRadius;

  const IconBox({
    super.key,
    required this.child,
    required this.color,
    this.size = 40,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(child: child),
    );
  }
}
