import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';

class CongestLogo extends StatelessWidget {
  final Color color;
  final double iconSize;
  final double fontSize;
  final Axis axis;

  const CongestLogo({
    super.key,
    this.color = AppColors.white,
    this.iconSize = 72,
    this.fontSize = 32,
    this.axis = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    final icon = _CongestIcon(size: iconSize, color: color);
    final text = Text(
      'ConGest',
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );

    if (axis == Axis.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 12),
          text,
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(height: 12),
        text,
      ],
    );
  }
}

class _CongestIcon extends StatelessWidget {
  final double size;
  final Color color;

  const _CongestIcon({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CongestIconPainter(color: color),
    );
  }
}

class _CongestIconPainter extends CustomPainter {
  final Color color;

  _CongestIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Scale factor to fit the SVG (original viewBox: 72x72) into the target size
    final scale = size.width / 72.0;

    // Path 1: Top arrow shape
    final path1 = Path();
    path1.moveTo(17.0445 * scale, 7.53809 * scale);
    // First curve (C command from SVG)
    path1.cubicTo(
      17.8483 * scale, 6.14579 * scale,
      19.3339 * scale, 5.28809 * scale,
      20.9416 * scale, 5.28809 * scale,
    );
    path1.lineTo(51.9497 * scale, 5.28809 * scale);
    // Second curve
    path1.cubicTo(
      53.5574 * scale, 5.28809 * scale,
      55.043 * scale, 6.14578 * scale,
      55.8468 * scale, 7.53809 * scale,
    );
    path1.lineTo(71.3509 * scale, 34.3919 * scale);
    // Third curve
    path1.cubicTo(
      72.1547 * scale, 35.7842 * scale,
      72.1547 * scale, 37.4996 * scale,
      71.3509 * scale, 38.8919 * scale,
    );
    path1.lineTo(59.4164 * scale, 59.563 * scale);
    path1.lineTo(55.5193 * scale, 52.813 * scale);
    path1.lineTo(64.8557 * scale, 36.6419 * scale);
    path1.lineTo(50.6507 * scale, 12.0381 * scale);
    path1.lineTo(22.2406 * scale, 12.0381 * scale);
    path1.lineTo(12.9525 * scale, 28.1256 * scale);
    path1.lineTo(5.15823 * scale, 28.1256 * scale);
    path1.lineTo(17.0445 * scale, 7.53809 * scale);
    path1.close();

    canvas.drawPath(path1, paint);

    // Path 2: Bottom filled shape
    final path2 = Path();
    path2.moveTo(50.7175 * scale, 61.13 * scale);
    path2.lineTo(54.2992 * scale, 67.3337 * scale);
    // Curve
    path2.cubicTo(
      53.6036 * scale, 67.7595 * scale,
      52.7935 * scale, 67.9958 * scale,
      51.9497 * scale, 67.9958 * scale,
    );
    path2.lineTo(20.9416 * scale, 67.9958 * scale);
    // Curve
    path2.cubicTo(
      19.3339 * scale, 67.9958 * scale,
      17.8483 * scale, 67.1381 * scale,
      17.0445 * scale, 65.7458 * scale,
    );
    path2.lineTo(1.54039 * scale, 38.8919 * scale);
    // Curve
    path2.cubicTo(
      1.12488 * scale, 38.1722 * scale,
      0.924142 * scale, 37.3662 * scale,
      0.938189 * scale, 36.5631 * scale,
    );
    path2.lineTo(34.6097 * scale, 36.5629 * scale);
    // Curve
    path2.cubicTo(
      35.8181 * scale, 36.5629 * scale,
      36.9343 * scale, 37.2089 * scale,
      37.5362 * scale, 38.2567 * scale,
    );
    path2.lineTo(50.6968 * scale, 61.1659 * scale);
    path2.lineTo(50.7175 * scale, 61.13 * scale);
    path2.close();

    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
