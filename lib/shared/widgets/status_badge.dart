import 'package:flutter/material.dart';

enum StatusBadgeType { success, warning, error, info }

/// Reusable status badge widget with customizable size and icon scale
class StatusBadge extends StatelessWidget {
  final double size;
  final StatusBadgeType type;
  final double iconScale;
  final Color? badgeColor;
  final Color? iconColor;

  const StatusBadge({
    super.key,
    this.size = 120,
    this.type = StatusBadgeType.success,
    this.iconScale = 0.4,
    this.badgeColor,
    this.iconColor,
  });

  Color get _defaultBadgeColor {
    switch (type) {
      case StatusBadgeType.success:
        return const Color(0xFF2FBF94);
      case StatusBadgeType.warning:
        return const Color(0xFFFFA726);
      case StatusBadgeType.error:
        return const Color(0xFFEF5350);
      case StatusBadgeType.info:
        return const Color(0xFF42A5F5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _StatusBadgePainter(
        badgeColor: badgeColor ?? _defaultBadgeColor,
        iconColor: iconColor ?? const Color(0xFFF9F9F9),
        iconScale: iconScale,
        type: type,
      ),
    );
  }
}

class _StatusBadgePainter extends CustomPainter {
  final Color badgeColor;
  final Color iconColor;
  final double iconScale;
  final StatusBadgeType type;

  _StatusBadgePainter({
    required this.badgeColor,
    required this.iconColor,
    required this.iconScale,
    required this.type,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawBadge(canvas, size);
    _drawIcon(canvas, size);
  }

  void _drawBadge(Canvas canvas, Size size) {
    final badgePaint = Paint()
      ..color = badgeColor
      ..style = PaintingStyle.fill;

    // Original badge coordinates span from ~17 to ~67 in X (center ~42)
    // and ~8 to ~54 in Y (center ~31) in an 85-unit space
    // We scale to fill the container
    final scale = size.width / 50;
    final offsetX = (size.width - 50 * scale) / 2 - 17 * scale;
    final offsetY = (size.height - 46 * scale) / 2 - 8 * scale;

    canvas.save();
    canvas.translate(offsetX, offsetY);

    final badgePath = Path();
    badgePath.moveTo(39.637 * scale, 9.46327 * scale);
    badgePath.cubicTo(
      41.3372 * scale, 8.20363 * scale,
      43.6628 * scale, 8.20363 * scale,
      45.363 * scale, 9.46327 * scale,
    );
    badgePath.lineTo(49.4524 * scale, 12.4926 * scale);
    badgePath.cubicTo(
      50.1614 * scale, 13.0175 * scale,
      51.0076 * scale, 13.3226 * scale,
      51.8829 * scale, 13.3703 * scale,
    );
    badgePath.lineTo(57.0262 * scale, 13.6508 * scale);
    badgePath.cubicTo(
      59.1753 * scale, 13.7681 * scale,
      60.9592 * scale, 15.3983 * scale,
      61.2734 * scale, 17.5294 * scale,
    );
    badgePath.lineTo(61.9393 * scale, 22.0457 * scale);
    badgePath.cubicTo(
      62.0699 * scale, 22.9319 * scale,
      62.4591 * scale, 23.7583 * scale,
      63.0569 * scale, 24.4215 * scale,
    );
    badgePath.lineTo(66.4743 * scale, 28.2127 * scale);
    badgePath.cubicTo(
      67.8838 * scale, 29.7763 * scale,
      67.8838 * scale, 32.1383 * scale,
      66.4743 * scale, 33.7019 * scale,
    );
    badgePath.lineTo(63.0569 * scale, 37.4931 * scale);
    badgePath.cubicTo(
      62.4591 * scale, 38.1563 * scale,
      62.0699 * scale, 38.9827 * scale,
      61.9393 * scale, 39.8689 * scale,
    );
    badgePath.lineTo(61.2734 * scale, 44.3852 * scale);
    badgePath.cubicTo(
      60.9592 * scale, 46.5163 * scale,
      59.1753 * scale, 48.1465 * scale,
      57.0262 * scale, 48.2638 * scale,
    );
    badgePath.lineTo(51.8829 * scale, 48.5443 * scale);
    badgePath.cubicTo(
      51.0076 * scale, 48.592 * scale,
      50.1614 * scale, 48.8971 * scale,
      49.4524 * scale, 49.422 * scale,
    );
    badgePath.lineTo(45.363 * scale, 52.4513 * scale);
    badgePath.cubicTo(
      43.6628 * scale, 53.711 * scale,
      41.3372 * scale, 53.711 * scale,
      39.637 * scale, 52.4513 * scale,
    );
    badgePath.lineTo(35.5476 * scale, 49.422 * scale);
    badgePath.cubicTo(
      34.8386 * scale, 48.8971 * scale,
      33.9924 * scale, 48.592 * scale,
      33.1171 * scale, 48.5443 * scale,
    );
    badgePath.lineTo(27.9738 * scale, 48.2638 * scale);
    badgePath.cubicTo(
      25.8247 * scale, 48.1465 * scale,
      24.0408 * scale, 46.5163 * scale,
      23.7266 * scale, 44.3852 * scale,
    );
    badgePath.lineTo(23.0607 * scale, 39.8689 * scale);
    badgePath.cubicTo(
      22.9301 * scale, 38.9827 * scale,
      22.5409 * scale, 38.1563 * scale,
      21.9431 * scale, 37.4931 * scale,
    );
    badgePath.lineTo(18.5257 * scale, 33.7019 * scale);
    badgePath.cubicTo(
      17.1162 * scale, 32.1383 * scale,
      17.1162 * scale, 29.7763 * scale,
      18.5257 * scale, 28.2127 * scale,
    );
    badgePath.lineTo(21.9431 * scale, 24.4215 * scale);
    badgePath.cubicTo(
      22.5409 * scale, 23.7583 * scale,
      22.9301 * scale, 22.9319 * scale,
      23.0607 * scale, 22.0457 * scale,
    );
    badgePath.lineTo(23.7266 * scale, 17.5294 * scale);
    badgePath.cubicTo(
      24.0408 * scale, 15.3983 * scale,
      25.8247 * scale, 13.7681 * scale,
      27.9738 * scale, 13.6508 * scale,
    );
    badgePath.lineTo(33.1171 * scale, 13.3703 * scale);
    badgePath.cubicTo(
      33.9924 * scale, 13.3226 * scale,
      34.8386 * scale, 13.0175 * scale,
      35.5476 * scale, 12.4926 * scale,
    );
    badgePath.close();

    canvas.drawPath(badgePath, badgePaint);
    canvas.restore();
  }

  void _drawIcon(Canvas canvas, Size size) {
    final iconPaint = Paint()
      ..color = iconColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * iconScale * 0.12
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final iconSize = size.width * iconScale;
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    canvas.save();
    canvas.translate(centerX, centerY);

    switch (type) {
      case StatusBadgeType.success:
        _drawCheckmark(canvas, iconSize, iconPaint);
        break;
      case StatusBadgeType.warning:
        _drawExclamation(canvas, iconSize, iconPaint);
        break;
      case StatusBadgeType.error:
        _drawX(canvas, iconSize, iconPaint);
        break;
      case StatusBadgeType.info:
        _drawInfo(canvas, iconSize, iconPaint);
        break;
    }

    canvas.restore();
  }

  void _drawCheckmark(Canvas canvas, double iconSize, Paint paint) {
    final halfSize = iconSize / 2;
    final checkPath = Path();
    checkPath.moveTo(-halfSize * 0.6, 0);
    checkPath.lineTo(-halfSize * 0.1, halfSize * 0.5);
    checkPath.lineTo(halfSize * 0.6, -halfSize * 0.5);
    canvas.drawPath(checkPath, paint);
  }

  void _drawExclamation(Canvas canvas, double iconSize, Paint paint) {
    final halfSize = iconSize / 2;
    // Vertical line
    canvas.drawLine(
      Offset(0, -halfSize * 0.6),
      Offset(0, halfSize * 0.1),
      paint,
    );
    // Dot
    final dotPaint = Paint()
      ..color = iconColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, halfSize * 0.5), paint.strokeWidth * 0.6, dotPaint);
  }

  void _drawX(Canvas canvas, double iconSize, Paint paint) {
    final halfSize = iconSize / 2;
    canvas.drawLine(
      Offset(-halfSize * 0.5, -halfSize * 0.5),
      Offset(halfSize * 0.5, halfSize * 0.5),
      paint,
    );
    canvas.drawLine(
      Offset(halfSize * 0.5, -halfSize * 0.5),
      Offset(-halfSize * 0.5, halfSize * 0.5),
      paint,
    );
  }

  void _drawInfo(Canvas canvas, double iconSize, Paint paint) {
    final halfSize = iconSize / 2;
    // Dot at top
    final dotPaint = Paint()
      ..color = iconColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, -halfSize * 0.5), paint.strokeWidth * 0.6, dotPaint);
    // Vertical line
    canvas.drawLine(
      Offset(0, -halfSize * 0.1),
      Offset(0, halfSize * 0.6),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _StatusBadgePainter oldDelegate) {
    return oldDelegate.badgeColor != badgeColor ||
        oldDelegate.iconColor != iconColor ||
        oldDelegate.iconScale != iconScale ||
        oldDelegate.type != type;
  }
}
