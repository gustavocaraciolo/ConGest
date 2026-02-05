import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

/// User Icon - Person silhouette
/// From: Iconia Pro - 22. Users/user.svg
class UserIcon extends StatelessWidget {
  final double size;
  final Color color;

  const UserIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _UserIconPainter(color: color),
    );
  }
}

class _UserIconPainter extends CustomPainter {
  final Color color;

  _UserIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Head circle outer
    final headOuterPath = Path();
    headOuterPath.addOval(Rect.fromCircle(
      center: Offset(12 * scale, 7 * scale),
      radius: 4.5 * scale,
    ));
    canvas.drawPath(headOuterPath, paint);

    // Head circle inner (white cutout)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final headInnerPath = Path();
    headInnerPath.addOval(Rect.fromCircle(
      center: Offset(12 * scale, 7 * scale),
      radius: 3.5 * scale,
    ));
    canvas.drawPath(headInnerPath, innerPaint);

    // Body outer path
    final bodyOuterPath = Path();
    bodyOuterPath.moveTo(4 * scale, 21.5 * scale);
    bodyOuterPath.cubicTo(4 * scale, 17.08 * scale, 7.58 * scale, 13.5 * scale,
        12 * scale, 13.5 * scale);
    bodyOuterPath.cubicTo(16.42 * scale, 13.5 * scale, 20 * scale, 17.08 * scale,
        20 * scale, 21.5 * scale);
    bodyOuterPath.lineTo(4 * scale, 21.5 * scale);
    bodyOuterPath.close();
    canvas.drawPath(bodyOuterPath, paint);

    // Body inner cutout
    final bodyInnerPath = Path();
    bodyInnerPath.moveTo(5 * scale, 20.5 * scale);
    bodyInnerPath.cubicTo(5.25 * scale, 17.3 * scale, 8.32 * scale, 14.5 * scale,
        12 * scale, 14.5 * scale);
    bodyInnerPath.cubicTo(15.68 * scale, 14.5 * scale, 18.75 * scale,
        17.3 * scale, 19 * scale, 20.5 * scale);
    bodyInnerPath.lineTo(5 * scale, 20.5 * scale);
    bodyInnerPath.close();
    canvas.drawPath(bodyInnerPath, innerPaint);
  }

  @override
  bool shouldRepaint(covariant _UserIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Notification Icon - Bell
/// From: Iconia Pro - 1. User Interface/notification.svg
class NotificationIcon extends StatelessWidget {
  final double size;
  final Color color;

  const NotificationIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _NotificationIconPainter(color: color),
    );
  }
}

class _NotificationIconPainter extends CustomPainter {
  final Color color;

  _NotificationIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Bell outer path
    final bellOuterPath = Path();
    bellOuterPath.moveTo(12 * scale, 2.5 * scale);
    bellOuterPath.cubicTo(7.86 * scale, 2.5 * scale, 4.5 * scale, 5.86 * scale,
        4.5 * scale, 10 * scale);
    bellOuterPath.lineTo(4.5 * scale, 14.59 * scale);
    bellOuterPath.lineTo(3.29 * scale, 15.79 * scale);
    bellOuterPath.cubicTo(2.68 * scale, 16.4 * scale, 3.11 * scale, 17.5 * scale,
        3.96 * scale, 17.5 * scale);
    bellOuterPath.lineTo(20.04 * scale, 17.5 * scale);
    bellOuterPath.cubicTo(20.89 * scale, 17.5 * scale, 21.32 * scale,
        16.4 * scale, 20.71 * scale, 15.79 * scale);
    bellOuterPath.lineTo(19.5 * scale, 14.59 * scale);
    bellOuterPath.lineTo(19.5 * scale, 10 * scale);
    bellOuterPath.cubicTo(19.5 * scale, 5.86 * scale, 16.14 * scale, 2.5 * scale,
        12 * scale, 2.5 * scale);
    bellOuterPath.close();
    canvas.drawPath(bellOuterPath, paint);

    // Bell inner cutout (white)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final bellInnerPath = Path();
    bellInnerPath.moveTo(12 * scale, 3.5 * scale);
    bellInnerPath.cubicTo(8.41 * scale, 3.5 * scale, 5.5 * scale, 6.41 * scale,
        5.5 * scale, 10 * scale);
    bellInnerPath.lineTo(5.5 * scale, 14.88 * scale);
    bellInnerPath.lineTo(5.21 * scale, 15.17 * scale);
    bellInnerPath.cubicTo(5.02 * scale, 15.36 * scale, 5.16 * scale, 16.5 * scale,
        5.5 * scale, 16.5 * scale);
    bellInnerPath.lineTo(18.5 * scale, 16.5 * scale);
    bellInnerPath.cubicTo(18.84 * scale, 16.5 * scale, 18.98 * scale,
        15.36 * scale, 18.79 * scale, 15.17 * scale);
    bellInnerPath.lineTo(18.5 * scale, 14.88 * scale);
    bellInnerPath.lineTo(18.5 * scale, 10 * scale);
    bellInnerPath.cubicTo(18.5 * scale, 6.41 * scale, 15.59 * scale, 3.5 * scale,
        12 * scale, 3.5 * scale);
    bellInnerPath.close();
    canvas.drawPath(bellInnerPath, innerPaint);

    // Bottom bell ringer
    final ringerPath = Path();
    ringerPath.moveTo(9 * scale, 19 * scale);
    ringerPath.cubicTo(9 * scale, 20.66 * scale, 10.34 * scale, 22 * scale,
        12 * scale, 22 * scale);
    ringerPath.cubicTo(13.66 * scale, 22 * scale, 15 * scale, 20.66 * scale,
        15 * scale, 19 * scale);
    ringerPath.lineTo(14 * scale, 19 * scale);
    ringerPath.cubicTo(14 * scale, 20.1 * scale, 13.1 * scale, 21 * scale,
        12 * scale, 21 * scale);
    ringerPath.cubicTo(10.9 * scale, 21 * scale, 10 * scale, 20.1 * scale,
        10 * scale, 19 * scale);
    ringerPath.lineTo(9 * scale, 19 * scale);
    ringerPath.close();
    canvas.drawPath(ringerPath, paint);
  }

  @override
  bool shouldRepaint(covariant _NotificationIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Globe Icon - Earth/World
/// From: Iconia Pro - 16. Education/globe.svg
class GlobeIcon extends StatelessWidget {
  final double size;
  final Color color;

  const GlobeIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _GlobeIconPainter(color: color),
    );
  }
}

class _GlobeIconPainter extends CustomPainter {
  final Color color;

  _GlobeIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Outer circle
    final outerPath = Path();
    outerPath.addOval(Rect.fromCircle(
      center: Offset(12 * scale, 12 * scale),
      radius: 9.5 * scale,
    ));
    canvas.drawPath(outerPath, paint);

    // Inner circle cutout
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final innerPath = Path();
    innerPath.addOval(Rect.fromCircle(
      center: Offset(12 * scale, 12 * scale),
      radius: 8.5 * scale,
    ));
    canvas.drawPath(innerPath, innerPaint);

    // Vertical ellipse (meridian)
    final meridianPath = Path();
    meridianPath.addOval(Rect.fromCenter(
      center: Offset(12 * scale, 12 * scale),
      width: 9 * scale,
      height: 17 * scale,
    ));

    final meridianStrokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1 * scale;
    canvas.drawPath(meridianPath, meridianStrokePaint);

    // Horizontal line (equator)
    canvas.drawLine(
      Offset(3.5 * scale, 12 * scale),
      Offset(20.5 * scale, 12 * scale),
      meridianStrokePaint,
    );

    // Top latitude line
    canvas.drawLine(
      Offset(5 * scale, 8 * scale),
      Offset(19 * scale, 8 * scale),
      meridianStrokePaint,
    );

    // Bottom latitude line
    canvas.drawLine(
      Offset(5 * scale, 16 * scale),
      Offset(19 * scale, 16 * scale),
      meridianStrokePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _GlobeIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Lock Icon - Padlock
/// From: Iconia Pro - 13. Security/lock.svg
class LockIcon extends StatelessWidget {
  final double size;
  final Color color;

  const LockIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _LockIconPainter(color: color),
    );
  }
}

class _LockIconPainter extends CustomPainter {
  final Color color;

  _LockIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Lock body outer
    final bodyOuterPath = Path();
    bodyOuterPath.moveTo(4.5 * scale, 11 * scale);
    bodyOuterPath.cubicTo(4.5 * scale, 9.61 * scale, 5.61 * scale, 8.5 * scale,
        7 * scale, 8.5 * scale);
    bodyOuterPath.lineTo(17 * scale, 8.5 * scale);
    bodyOuterPath.cubicTo(18.39 * scale, 8.5 * scale, 19.5 * scale, 9.61 * scale,
        19.5 * scale, 11 * scale);
    bodyOuterPath.lineTo(19.5 * scale, 19 * scale);
    bodyOuterPath.cubicTo(19.5 * scale, 20.39 * scale, 18.39 * scale,
        21.5 * scale, 17 * scale, 21.5 * scale);
    bodyOuterPath.lineTo(7 * scale, 21.5 * scale);
    bodyOuterPath.cubicTo(5.61 * scale, 21.5 * scale, 4.5 * scale, 20.39 * scale,
        4.5 * scale, 19 * scale);
    bodyOuterPath.lineTo(4.5 * scale, 11 * scale);
    bodyOuterPath.close();
    canvas.drawPath(bodyOuterPath, paint);

    // Lock body inner (white)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final bodyInnerPath = Path();
    bodyInnerPath.moveTo(5.5 * scale, 11 * scale);
    bodyInnerPath.cubicTo(5.5 * scale, 10.17 * scale, 6.17 * scale, 9.5 * scale,
        7 * scale, 9.5 * scale);
    bodyInnerPath.lineTo(17 * scale, 9.5 * scale);
    bodyInnerPath.cubicTo(17.83 * scale, 9.5 * scale, 18.5 * scale, 10.17 * scale,
        18.5 * scale, 11 * scale);
    bodyInnerPath.lineTo(18.5 * scale, 19 * scale);
    bodyInnerPath.cubicTo(18.5 * scale, 19.83 * scale, 17.83 * scale,
        20.5 * scale, 17 * scale, 20.5 * scale);
    bodyInnerPath.lineTo(7 * scale, 20.5 * scale);
    bodyInnerPath.cubicTo(6.17 * scale, 20.5 * scale, 5.5 * scale, 19.83 * scale,
        5.5 * scale, 19 * scale);
    bodyInnerPath.lineTo(5.5 * scale, 11 * scale);
    bodyInnerPath.close();
    canvas.drawPath(bodyInnerPath, innerPaint);

    // Lock shackle (U-shape at top)
    final shacklePath = Path();
    shacklePath.moveTo(8 * scale, 8.5 * scale);
    shacklePath.lineTo(8 * scale, 7 * scale);
    shacklePath.cubicTo(8 * scale, 4.79 * scale, 9.79 * scale, 3 * scale,
        12 * scale, 3 * scale);
    shacklePath.cubicTo(14.21 * scale, 3 * scale, 16 * scale, 4.79 * scale,
        16 * scale, 7 * scale);
    shacklePath.lineTo(16 * scale, 8.5 * scale);
    shacklePath.lineTo(17 * scale, 8.5 * scale);
    shacklePath.lineTo(17 * scale, 7 * scale);
    shacklePath.cubicTo(17 * scale, 4.24 * scale, 14.76 * scale, 2 * scale,
        12 * scale, 2 * scale);
    shacklePath.cubicTo(9.24 * scale, 2 * scale, 7 * scale, 4.24 * scale,
        7 * scale, 7 * scale);
    shacklePath.lineTo(7 * scale, 8.5 * scale);
    shacklePath.lineTo(8 * scale, 8.5 * scale);
    shacklePath.close();
    canvas.drawPath(shacklePath, paint);

    // Keyhole circle
    final keyholeCircle = Path();
    keyholeCircle.addOval(Rect.fromCircle(
      center: Offset(12 * scale, 14 * scale),
      radius: 1.5 * scale,
    ));
    canvas.drawPath(keyholeCircle, paint);

    // Keyhole line
    final keyholeLine =
        Rect.fromLTWH(11.5 * scale, 14.5 * scale, 1 * scale, 3 * scale);
    canvas.drawRect(keyholeLine, paint);
  }

  @override
  bool shouldRepaint(covariant _LockIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Fingerprint Icon
/// From: Iconia Pro - 13. Security/fingerprint.svg
class FingerprintIcon extends StatelessWidget {
  final double size;
  final Color color;

  const FingerprintIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _FingerprintIconPainter(color: color),
    );
  }
}

class _FingerprintIconPainter extends CustomPainter {
  final Color color;

  _FingerprintIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5 * (size.width / 24)
      ..strokeCap = StrokeCap.round;

    final scale = size.width / 24;

    // Outer arc (left side)
    final outerLeftPath = Path();
    outerLeftPath.moveTo(4.5 * scale, 14 * scale);
    outerLeftPath.cubicTo(4.5 * scale, 9.86 * scale, 7.86 * scale, 6.5 * scale,
        12 * scale, 6.5 * scale);
    canvas.drawPath(outerLeftPath, paint);

    // Outer arc (right side)
    final outerRightPath = Path();
    outerRightPath.moveTo(19.5 * scale, 14 * scale);
    outerRightPath.cubicTo(19.5 * scale, 9.86 * scale, 16.14 * scale, 6.5 * scale,
        12 * scale, 6.5 * scale);
    canvas.drawPath(outerRightPath, paint);

    // Middle arc
    final middlePath = Path();
    middlePath.moveTo(6.5 * scale, 17 * scale);
    middlePath.cubicTo(6.5 * scale, 13.96 * scale, 8.96 * scale, 9.5 * scale,
        12 * scale, 9.5 * scale);
    middlePath.cubicTo(15.04 * scale, 9.5 * scale, 17.5 * scale, 11.96 * scale,
        17.5 * scale, 15 * scale);
    canvas.drawPath(middlePath, paint);

    // Inner arc (center)
    final innerPath = Path();
    innerPath.moveTo(9 * scale, 19 * scale);
    innerPath.cubicTo(9 * scale, 17.34 * scale, 10.34 * scale, 12.5 * scale,
        12 * scale, 12.5 * scale);
    innerPath.cubicTo(13.66 * scale, 12.5 * scale, 15 * scale, 13.84 * scale,
        15 * scale, 15.5 * scale);
    canvas.drawPath(innerPath, paint);

    // Center line
    final centerPath = Path();
    centerPath.moveTo(12 * scale, 15.5 * scale);
    centerPath.lineTo(12 * scale, 21 * scale);
    canvas.drawPath(centerPath, paint);

    // Top small arc
    final topPath = Path();
    topPath.moveTo(8 * scale, 4.5 * scale);
    topPath.cubicTo(9.2 * scale, 3.8 * scale, 10.55 * scale, 3.5 * scale,
        12 * scale, 3.5 * scale);
    topPath.cubicTo(13.45 * scale, 3.5 * scale, 14.8 * scale, 3.8 * scale,
        16 * scale, 4.5 * scale);
    canvas.drawPath(topPath, paint);
  }

  @override
  bool shouldRepaint(covariant _FingerprintIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Devices Icon - Mobile and Monitor
/// From: Iconia Pro - 17. Device/mobile and monitor.svg
class DevicesIcon extends StatelessWidget {
  final double size;
  final Color color;

  const DevicesIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DevicesIconPainter(color: color),
    );
  }
}

class _DevicesIconPainter extends CustomPainter {
  final Color color;

  _DevicesIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Monitor outer
    final monitorOuterPath = Path();
    monitorOuterPath.moveTo(2.5 * scale, 5 * scale);
    monitorOuterPath.cubicTo(2.5 * scale, 3.61 * scale, 3.61 * scale, 2.5 * scale,
        5 * scale, 2.5 * scale);
    monitorOuterPath.lineTo(19 * scale, 2.5 * scale);
    monitorOuterPath.cubicTo(20.39 * scale, 2.5 * scale, 21.5 * scale,
        3.61 * scale, 21.5 * scale, 5 * scale);
    monitorOuterPath.lineTo(21.5 * scale, 13 * scale);
    monitorOuterPath.cubicTo(21.5 * scale, 14.39 * scale, 20.39 * scale,
        15.5 * scale, 19 * scale, 15.5 * scale);
    monitorOuterPath.lineTo(14 * scale, 15.5 * scale);
    monitorOuterPath.lineTo(14 * scale, 14.5 * scale);
    monitorOuterPath.lineTo(19 * scale, 14.5 * scale);
    monitorOuterPath.cubicTo(19.83 * scale, 14.5 * scale, 20.5 * scale,
        13.83 * scale, 20.5 * scale, 13 * scale);
    monitorOuterPath.lineTo(20.5 * scale, 5 * scale);
    monitorOuterPath.cubicTo(20.5 * scale, 4.17 * scale, 19.83 * scale,
        3.5 * scale, 19 * scale, 3.5 * scale);
    monitorOuterPath.lineTo(5 * scale, 3.5 * scale);
    monitorOuterPath.cubicTo(4.17 * scale, 3.5 * scale, 3.5 * scale, 4.17 * scale,
        3.5 * scale, 5 * scale);
    monitorOuterPath.lineTo(3.5 * scale, 13 * scale);
    monitorOuterPath.cubicTo(3.5 * scale, 13.83 * scale, 4.17 * scale,
        14.5 * scale, 5 * scale, 14.5 * scale);
    monitorOuterPath.lineTo(6 * scale, 14.5 * scale);
    monitorOuterPath.lineTo(6 * scale, 15.5 * scale);
    monitorOuterPath.lineTo(5 * scale, 15.5 * scale);
    monitorOuterPath.cubicTo(3.61 * scale, 15.5 * scale, 2.5 * scale,
        14.39 * scale, 2.5 * scale, 13 * scale);
    monitorOuterPath.lineTo(2.5 * scale, 5 * scale);
    monitorOuterPath.close();
    canvas.drawPath(monitorOuterPath, paint);

    // Monitor stand
    final standPath = Path();
    standPath.moveTo(10 * scale, 17 * scale);
    standPath.lineTo(10 * scale, 18 * scale);
    standPath.lineTo(8 * scale, 18 * scale);
    standPath.lineTo(8 * scale, 19 * scale);
    standPath.lineTo(13 * scale, 19 * scale);
    standPath.lineTo(13 * scale, 18 * scale);
    standPath.lineTo(11 * scale, 18 * scale);
    standPath.lineTo(11 * scale, 17 * scale);
    standPath.lineTo(10 * scale, 17 * scale);
    standPath.close();
    canvas.drawPath(standPath, paint);

    // Mobile phone outer
    final phoneOuterPath = Path();
    phoneOuterPath.moveTo(14.5 * scale, 10 * scale);
    phoneOuterPath.cubicTo(14.5 * scale, 9.17 * scale, 15.17 * scale, 8.5 * scale,
        16 * scale, 8.5 * scale);
    phoneOuterPath.lineTo(20 * scale, 8.5 * scale);
    phoneOuterPath.cubicTo(20.83 * scale, 8.5 * scale, 21.5 * scale, 9.17 * scale,
        21.5 * scale, 10 * scale);
    phoneOuterPath.lineTo(21.5 * scale, 20 * scale);
    phoneOuterPath.cubicTo(21.5 * scale, 20.83 * scale, 20.83 * scale,
        21.5 * scale, 20 * scale, 21.5 * scale);
    phoneOuterPath.lineTo(16 * scale, 21.5 * scale);
    phoneOuterPath.cubicTo(15.17 * scale, 21.5 * scale, 14.5 * scale,
        20.83 * scale, 14.5 * scale, 20 * scale);
    phoneOuterPath.lineTo(14.5 * scale, 10 * scale);
    phoneOuterPath.close();
    canvas.drawPath(phoneOuterPath, paint);

    // Mobile phone inner (white)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final phoneInnerPath = Path();
    phoneInnerPath.moveTo(15.5 * scale, 10 * scale);
    phoneInnerPath.cubicTo(15.5 * scale, 9.72 * scale, 15.72 * scale, 9.5 * scale,
        16 * scale, 9.5 * scale);
    phoneInnerPath.lineTo(20 * scale, 9.5 * scale);
    phoneInnerPath.cubicTo(20.28 * scale, 9.5 * scale, 20.5 * scale, 9.72 * scale,
        20.5 * scale, 10 * scale);
    phoneInnerPath.lineTo(20.5 * scale, 20 * scale);
    phoneInnerPath.cubicTo(20.5 * scale, 20.28 * scale, 20.28 * scale,
        20.5 * scale, 20 * scale, 20.5 * scale);
    phoneInnerPath.lineTo(16 * scale, 20.5 * scale);
    phoneInnerPath.cubicTo(15.72 * scale, 20.5 * scale, 15.5 * scale,
        20.28 * scale, 15.5 * scale, 20 * scale);
    phoneInnerPath.lineTo(15.5 * scale, 10 * scale);
    phoneInnerPath.close();
    canvas.drawPath(phoneInnerPath, innerPaint);

    // Phone home button indicator
    final homeButton =
        Rect.fromLTWH(17.25 * scale, 18.5 * scale, 1.5 * scale, 1 * scale);
    final homeButtonRRect =
        RRect.fromRectAndRadius(homeButton, Radius.circular(0.5 * scale));
    canvas.drawRRect(homeButtonRRect, paint);
  }

  @override
  bool shouldRepaint(covariant _DevicesIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Palette Icon - Color palette
/// From: Iconia Pro - 36. Design Graphic/color pallete.svg
class PaletteIcon extends StatelessWidget {
  final double size;
  final Color color;

  const PaletteIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _PaletteIconPainter(color: color),
    );
  }
}

class _PaletteIconPainter extends CustomPainter {
  final Color color;

  _PaletteIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Palette outer shape
    final outerPath = Path();
    outerPath.moveTo(12 * scale, 2.5 * scale);
    outerPath.cubicTo(6.75 * scale, 2.5 * scale, 2.5 * scale, 6.75 * scale,
        2.5 * scale, 12 * scale);
    outerPath.cubicTo(2.5 * scale, 17.25 * scale, 6.75 * scale, 21.5 * scale,
        12 * scale, 21.5 * scale);
    outerPath.cubicTo(12.83 * scale, 21.5 * scale, 13.5 * scale, 20.83 * scale,
        13.5 * scale, 20 * scale);
    outerPath.cubicTo(13.5 * scale, 19.61 * scale, 13.35 * scale, 19.25 * scale,
        13.1 * scale, 19 * scale);
    outerPath.cubicTo(12.86 * scale, 18.74 * scale, 12.72 * scale, 18.39 * scale,
        12.72 * scale, 18 * scale);
    outerPath.cubicTo(12.72 * scale, 17.17 * scale, 13.39 * scale, 16.5 * scale,
        14.22 * scale, 16.5 * scale);
    outerPath.lineTo(16 * scale, 16.5 * scale);
    outerPath.cubicTo(19.04 * scale, 16.5 * scale, 21.5 * scale, 14.04 * scale,
        21.5 * scale, 11 * scale);
    outerPath.cubicTo(21.5 * scale, 6.31 * scale, 17.25 * scale, 2.5 * scale,
        12 * scale, 2.5 * scale);
    outerPath.close();
    canvas.drawPath(outerPath, paint);

    // Palette inner (white)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final innerPath = Path();
    innerPath.moveTo(12 * scale, 3.5 * scale);
    innerPath.cubicTo(7.3 * scale, 3.5 * scale, 3.5 * scale, 7.3 * scale,
        3.5 * scale, 12 * scale);
    innerPath.cubicTo(3.5 * scale, 16.7 * scale, 7.3 * scale, 20.5 * scale,
        12 * scale, 20.5 * scale);
    innerPath.cubicTo(12.28 * scale, 20.5 * scale, 12.5 * scale, 20.28 * scale,
        12.5 * scale, 20 * scale);
    innerPath.cubicTo(12.5 * scale, 19.86 * scale, 12.44 * scale, 19.73 * scale,
        12.35 * scale, 19.64 * scale);
    innerPath.cubicTo(11.84 * scale, 19.13 * scale, 11.72 * scale, 18.58 * scale,
        11.72 * scale, 18 * scale);
    innerPath.cubicTo(11.72 * scale, 16.62 * scale, 12.84 * scale, 15.5 * scale,
        14.22 * scale, 15.5 * scale);
    innerPath.lineTo(16 * scale, 15.5 * scale);
    innerPath.cubicTo(18.49 * scale, 15.5 * scale, 20.5 * scale, 13.49 * scale,
        20.5 * scale, 11 * scale);
    innerPath.cubicTo(20.5 * scale, 6.86 * scale, 16.7 * scale, 3.5 * scale,
        12 * scale, 3.5 * scale);
    innerPath.close();
    canvas.drawPath(innerPath, innerPaint);

    // Color dot 1 (top left)
    final dot1 = Path();
    dot1.addOval(Rect.fromCircle(
      center: Offset(7 * scale, 10 * scale),
      radius: 1.5 * scale,
    ));
    canvas.drawPath(dot1, paint);

    // Color dot 2 (top)
    final dot2 = Path();
    dot2.addOval(Rect.fromCircle(
      center: Offset(10 * scale, 7 * scale),
      radius: 1.5 * scale,
    ));
    canvas.drawPath(dot2, paint);

    // Color dot 3 (top right)
    final dot3 = Path();
    dot3.addOval(Rect.fromCircle(
      center: Offset(15 * scale, 7 * scale),
      radius: 1.5 * scale,
    ));
    canvas.drawPath(dot3, paint);

    // Color dot 4 (right)
    final dot4 = Path();
    dot4.addOval(Rect.fromCircle(
      center: Offset(18 * scale, 10 * scale),
      radius: 1.5 * scale,
    ));
    canvas.drawPath(dot4, paint);
  }

  @override
  bool shouldRepaint(covariant _PaletteIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Volume Icon - Speaker with sound waves
/// From: Iconia Pro - 1. User Interface/volume up.svg
class VolumeIcon extends StatelessWidget {
  final double size;
  final Color color;

  const VolumeIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _VolumeIconPainter(color: color),
    );
  }
}

class _VolumeIconPainter extends CustomPainter {
  final Color color;

  _VolumeIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Speaker body outer
    final speakerOuterPath = Path();
    speakerOuterPath.moveTo(3.5 * scale, 9 * scale);
    speakerOuterPath.cubicTo(3.5 * scale, 8.17 * scale, 4.17 * scale, 7.5 * scale,
        5 * scale, 7.5 * scale);
    speakerOuterPath.lineTo(7.59 * scale, 7.5 * scale);
    speakerOuterPath.lineTo(12.29 * scale, 3.79 * scale);
    speakerOuterPath.cubicTo(12.92 * scale, 3.29 * scale, 13.83 * scale,
        3.73 * scale, 13.83 * scale, 4.54 * scale);
    speakerOuterPath.lineTo(13.83 * scale, 19.46 * scale);
    speakerOuterPath.cubicTo(13.83 * scale, 20.27 * scale, 12.92 * scale,
        20.71 * scale, 12.29 * scale, 20.21 * scale);
    speakerOuterPath.lineTo(7.59 * scale, 16.5 * scale);
    speakerOuterPath.lineTo(5 * scale, 16.5 * scale);
    speakerOuterPath.cubicTo(4.17 * scale, 16.5 * scale, 3.5 * scale,
        15.83 * scale, 3.5 * scale, 15 * scale);
    speakerOuterPath.lineTo(3.5 * scale, 9 * scale);
    speakerOuterPath.close();
    canvas.drawPath(speakerOuterPath, paint);

    // Speaker body inner (white)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final speakerInnerPath = Path();
    speakerInnerPath.moveTo(4.5 * scale, 9 * scale);
    speakerInnerPath.cubicTo(4.5 * scale, 8.72 * scale, 4.72 * scale, 8.5 * scale,
        5 * scale, 8.5 * scale);
    speakerInnerPath.lineTo(7.88 * scale, 8.5 * scale);
    speakerInnerPath.lineTo(12.83 * scale, 4.59 * scale);
    speakerInnerPath.lineTo(12.83 * scale, 19.41 * scale);
    speakerInnerPath.lineTo(7.88 * scale, 15.5 * scale);
    speakerInnerPath.lineTo(5 * scale, 15.5 * scale);
    speakerInnerPath.cubicTo(4.72 * scale, 15.5 * scale, 4.5 * scale,
        15.28 * scale, 4.5 * scale, 15 * scale);
    speakerInnerPath.lineTo(4.5 * scale, 9 * scale);
    speakerInnerPath.close();
    canvas.drawPath(speakerInnerPath, innerPaint);

    // Sound wave 1 (small)
    final wave1Paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1 * scale
      ..strokeCap = StrokeCap.round;

    final wave1Path = Path();
    wave1Path.moveTo(16 * scale, 9.5 * scale);
    wave1Path.cubicTo(17.23 * scale, 10.34 * scale, 18 * scale, 11.1 * scale,
        18 * scale, 12 * scale);
    wave1Path.cubicTo(18 * scale, 12.9 * scale, 17.23 * scale, 13.66 * scale,
        16 * scale, 14.5 * scale);
    canvas.drawPath(wave1Path, wave1Paint);

    // Sound wave 2 (large)
    final wave2Path = Path();
    wave2Path.moveTo(18.5 * scale, 7 * scale);
    wave2Path.cubicTo(20.43 * scale, 8.37 * scale, 21.5 * scale, 10.1 * scale,
        21.5 * scale, 12 * scale);
    wave2Path.cubicTo(21.5 * scale, 13.9 * scale, 20.43 * scale, 15.63 * scale,
        18.5 * scale, 17 * scale);
    canvas.drawPath(wave2Path, wave1Paint);
  }

  @override
  bool shouldRepaint(covariant _VolumeIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Logout Icon - Arrow pointing out of door
/// From: Iconia Pro - 1. User Interface/logout.svg
class LogoutIcon extends StatelessWidget {
  final double size;
  final Color color;

  const LogoutIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _LogoutIconPainter(color: color),
    );
  }
}

class _LogoutIconPainter extends CustomPainter {
  final Color color;

  _LogoutIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Door frame outer
    final doorOuterPath = Path();
    doorOuterPath.moveTo(3.5 * scale, 5 * scale);
    doorOuterPath.cubicTo(3.5 * scale, 3.61 * scale, 4.61 * scale, 2.5 * scale,
        6 * scale, 2.5 * scale);
    doorOuterPath.lineTo(12 * scale, 2.5 * scale);
    doorOuterPath.lineTo(12 * scale, 3.5 * scale);
    doorOuterPath.lineTo(6 * scale, 3.5 * scale);
    doorOuterPath.cubicTo(5.17 * scale, 3.5 * scale, 4.5 * scale, 4.17 * scale,
        4.5 * scale, 5 * scale);
    doorOuterPath.lineTo(4.5 * scale, 19 * scale);
    doorOuterPath.cubicTo(4.5 * scale, 19.83 * scale, 5.17 * scale, 20.5 * scale,
        6 * scale, 20.5 * scale);
    doorOuterPath.lineTo(12 * scale, 20.5 * scale);
    doorOuterPath.lineTo(12 * scale, 21.5 * scale);
    doorOuterPath.lineTo(6 * scale, 21.5 * scale);
    doorOuterPath.cubicTo(4.61 * scale, 21.5 * scale, 3.5 * scale, 20.39 * scale,
        3.5 * scale, 19 * scale);
    doorOuterPath.lineTo(3.5 * scale, 5 * scale);
    doorOuterPath.close();
    canvas.drawPath(doorOuterPath, paint);

    // Arrow line
    final arrowLinePath = Path();
    arrowLinePath.moveTo(9 * scale, 12 * scale);
    arrowLinePath.lineTo(20 * scale, 12 * scale);
    arrowLinePath.lineTo(20 * scale, 11 * scale);
    arrowLinePath.lineTo(9 * scale, 11 * scale);
    arrowLinePath.lineTo(9 * scale, 12 * scale);
    arrowLinePath.close();
    canvas.drawPath(arrowLinePath, paint);

    // Arrow head
    final arrowHeadPath = Path();
    arrowHeadPath.moveTo(16.15 * scale, 7.15 * scale);
    arrowHeadPath.lineTo(20.5 * scale, 11.5 * scale);
    arrowHeadPath.lineTo(16.15 * scale, 15.85 * scale);
    arrowHeadPath.lineTo(15.44 * scale, 15.14 * scale);
    arrowHeadPath.lineTo(19.08 * scale, 11.5 * scale);
    arrowHeadPath.lineTo(15.44 * scale, 7.86 * scale);
    arrowHeadPath.lineTo(16.15 * scale, 7.15 * scale);
    arrowHeadPath.close();
    canvas.drawPath(arrowHeadPath, paint);
  }

  @override
  bool shouldRepaint(covariant _LogoutIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// FAQ Icon - Chat bubble with question mark
/// From: Iconia Pro - 4. Chat/help 1.svg
class FaqIcon extends StatelessWidget {
  final double size;
  final Color color;

  const FaqIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _FaqIconPainter(color: color),
    );
  }
}

class _FaqIconPainter extends CustomPainter {
  final Color color;

  _FaqIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Chat bubble outline
    final bubblePath = Path();
    bubblePath.moveTo(12 * scale, 3.5 * scale);
    bubblePath.cubicTo(7.3 * scale, 3.5 * scale, 3.5 * scale, 7.3 * scale,
        3.5 * scale, 12 * scale);
    bubblePath.cubicTo(3.5 * scale, 13.34 * scale, 3.81 * scale, 14.61 * scale,
        4.36 * scale, 15.74 * scale);
    bubblePath.cubicTo(4.45 * scale, 15.93 * scale, 4.49 * scale, 16.16 * scale,
        4.44 * scale, 16.39 * scale);
    bubblePath.lineTo(3.62 * scale, 20.36 * scale);
    bubblePath.lineTo(7.72 * scale, 19.59 * scale);
    bubblePath.cubicTo(7.93 * scale, 19.54 * scale, 8.15 * scale, 19.58 * scale,
        8.34 * scale, 19.67 * scale);
    bubblePath.cubicTo(9.44 * scale, 20.19 * scale, 10.67 * scale, 20.48 * scale,
        11.97 * scale, 20.48 * scale);
    bubblePath.cubicTo(16.66 * scale, 20.48 * scale, 20.47 * scale,
        16.67 * scale, 20.47 * scale, 11.98 * scale);
    bubblePath.cubicTo(20.47 * scale, 7.28 * scale, 16.66 * scale, 3.48 * scale,
        11.97 * scale, 3.48 * scale);
    bubblePath.close();

    // Outer path
    final outerPath = Path();
    outerPath.moveTo(2.5 * scale, 12 * scale);
    outerPath.cubicTo(2.5 * scale, 6.75 * scale, 6.75 * scale, 2.5 * scale,
        12 * scale, 2.5 * scale);
    outerPath.cubicTo(17.24 * scale, 2.5 * scale, 21.5 * scale, 6.75 * scale,
        21.5 * scale, 12 * scale);
    outerPath.cubicTo(21.5 * scale, 17.24 * scale, 17.24 * scale, 21.5 * scale,
        12 * scale, 21.5 * scale);
    outerPath.cubicTo(10.54 * scale, 21.5 * scale, 9.16 * scale, 21.17 * scale,
        7.93 * scale, 20.58 * scale);
    outerPath.lineTo(3.82 * scale, 21.34 * scale);
    outerPath.cubicTo(3.12 * scale, 21.47 * scale, 2.51 * scale, 20.85 * scale,
        2.65 * scale, 20.15 * scale);
    outerPath.lineTo(3.46 * scale, 16.17 * scale);
    outerPath.cubicTo(2.83 * scale, 14.9 * scale, 2.48 * scale, 13.48 * scale,
        2.48 * scale, 11.97 * scale);
    outerPath.close();

    canvas.drawPath(outerPath, paint);

    // Inner cutout (white)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawPath(bubblePath, innerPaint);

    // Question mark stem
    final questionPath = Path();
    questionPath.moveTo(11.5 * scale, 7 * scale);
    questionPath.cubicTo(10.67 * scale, 7 * scale, 10 * scale, 7.67 * scale,
        10 * scale, 8.5 * scale);
    questionPath.lineTo(10 * scale, 9.5 * scale);
    questionPath.lineTo(9 * scale, 9.5 * scale);
    questionPath.lineTo(9 * scale, 8.5 * scale);
    questionPath.cubicTo(
        9 * scale, 7.11 * scale, 10.11 * scale, 6 * scale, 11.5 * scale, 6 * scale);
    questionPath.lineTo(12.5 * scale, 6 * scale);
    questionPath.cubicTo(13.88 * scale, 6 * scale, 15 * scale, 7.11 * scale,
        15 * scale, 8.5 * scale);
    questionPath.lineTo(15 * scale, 9.67 * scale);
    questionPath.cubicTo(15 * scale, 10.33 * scale, 14.73 * scale, 10.96 * scale,
        14.26 * scale, 11.43 * scale);
    questionPath.lineTo(12.93 * scale, 12.75 * scale);
    questionPath.cubicTo(12.64 * scale, 13.03 * scale, 12.49 * scale,
        13.41 * scale, 12.49 * scale, 13.81 * scale);
    questionPath.lineTo(12.49 * scale, 15.48 * scale);
    questionPath.lineTo(11.49 * scale, 15.48 * scale);
    questionPath.lineTo(11.49 * scale, 13.8 * scale);
    questionPath.cubicTo(11.49 * scale, 13.13 * scale, 11.75 * scale,
        12.5 * scale, 12.22 * scale, 12.03 * scale);
    questionPath.lineTo(13.54 * scale, 10.7 * scale);
    questionPath.cubicTo(13.82 * scale, 10.41 * scale, 13.97 * scale,
        10.03 * scale, 13.97 * scale, 9.63 * scale);
    questionPath.lineTo(13.97 * scale, 8.45 * scale);
    questionPath.cubicTo(13.97 * scale, 7.62 * scale, 13.29 * scale, 6.95 * scale,
        12.47 * scale, 6.95 * scale);
    questionPath.lineTo(11.47 * scale, 6.95 * scale);
    questionPath.close();

    canvas.drawPath(questionPath, paint);

    // Question mark dot
    final dotRect =
        Rect.fromLTWH(11.5 * scale, 16.5 * scale, 1 * scale, 2 * scale);
    canvas.drawRect(dotRect, paint);
  }

  @override
  bool shouldRepaint(covariant _FaqIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Help Center Icon - Document with checklist
/// From: Iconia Pro - 5. Files/list file.svg
class HelpCenterIcon extends StatelessWidget {
  final double size;
  final Color color;

  const HelpCenterIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _HelpCenterIconPainter(color: color),
    );
  }
}

class _HelpCenterIconPainter extends CustomPainter {
  final Color color;

  _HelpCenterIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Outer document path
    final outerPath = Path();
    outerPath.moveTo(3.5 * scale, 4 * scale);
    outerPath.cubicTo(3.5 * scale, 2.61 * scale, 4.61 * scale, 1.5 * scale,
        6 * scale, 1.5 * scale);
    outerPath.lineTo(12.26 * scale, 1.5 * scale);
    outerPath.cubicTo(12.85 * scale, 1.5 * scale, 13.43 * scale, 1.71 * scale,
        13.88 * scale, 2.1 * scale);
    outerPath.lineTo(19.61 * scale, 7.01 * scale);
    outerPath.cubicTo(20.16 * scale, 7.48 * scale, 20.48 * scale, 8.17 * scale,
        20.48 * scale, 8.9 * scale);
    outerPath.lineTo(20.48 * scale, 19.98 * scale);
    outerPath.cubicTo(20.48 * scale, 21.36 * scale, 19.36 * scale, 22.48 * scale,
        17.98 * scale, 22.48 * scale);
    outerPath.lineTo(5.98 * scale, 22.48 * scale);
    outerPath.cubicTo(4.59 * scale, 22.48 * scale, 3.48 * scale, 21.36 * scale,
        3.48 * scale, 19.98 * scale);
    outerPath.lineTo(3.48 * scale, 3.98 * scale);
    outerPath.close();

    canvas.drawPath(outerPath, paint);

    // Inner cutout (white document interior)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final innerPath = Path();
    innerPath.moveTo(6 * scale, 2.5 * scale);
    innerPath.cubicTo(5.17 * scale, 2.5 * scale, 4.5 * scale, 3.17 * scale,
        4.5 * scale, 4 * scale);
    innerPath.lineTo(4.5 * scale, 20 * scale);
    innerPath.cubicTo(4.5 * scale, 20.82 * scale, 5.17 * scale, 21.5 * scale,
        6 * scale, 21.5 * scale);
    innerPath.lineTo(18 * scale, 21.5 * scale);
    innerPath.cubicTo(18.82 * scale, 21.5 * scale, 19.5 * scale, 20.82 * scale,
        19.5 * scale, 20 * scale);
    innerPath.lineTo(19.5 * scale, 8.91 * scale);
    innerPath.cubicTo(19.5 * scale, 8.47 * scale, 19.3 * scale, 8.05 * scale,
        18.97 * scale, 7.77 * scale);
    innerPath.lineTo(13.23 * scale, 2.85 * scale);
    innerPath.cubicTo(12.95 * scale, 2.61 * scale, 12.61 * scale, 2.48 * scale,
        12.25 * scale, 2.48 * scale);
    innerPath.lineTo(5.98 * scale, 2.48 * scale);
    innerPath.close();

    canvas.drawPath(innerPath, innerPaint);

    // Fold corner
    final foldPath = Path();
    foldPath.moveTo(12.5 * scale, 6 * scale);
    foldPath.lineTo(12.5 * scale, 2.5 * scale);
    foldPath.lineTo(13.5 * scale, 2.5 * scale);
    foldPath.lineTo(13.5 * scale, 6 * scale);
    foldPath.cubicTo(13.5 * scale, 6.82 * scale, 14.17 * scale, 7.5 * scale,
        15 * scale, 7.5 * scale);
    foldPath.lineTo(19 * scale, 7.5 * scale);
    foldPath.lineTo(19 * scale, 8.5 * scale);
    foldPath.lineTo(15 * scale, 8.5 * scale);
    foldPath.cubicTo(13.61 * scale, 8.5 * scale, 12.5 * scale, 7.38 * scale,
        12.5 * scale, 6 * scale);
    foldPath.close();

    canvas.drawPath(foldPath, paint);

    // Checkbox 1
    final checkbox1 = RRect.fromRectAndRadius(
      Rect.fromLTWH(6.5 * scale, 10.5 * scale, 3 * scale, 3 * scale),
      Radius.circular(0.5 * scale),
    );
    canvas.drawRRect(checkbox1, paint);

    final checkbox1Inner = RRect.fromRectAndRadius(
      Rect.fromLTWH(7.5 * scale, 11.5 * scale, 1 * scale, 1 * scale),
      Radius.circular(0.25 * scale),
    );
    canvas.drawRRect(checkbox1Inner, innerPaint);

    // Checkbox 2
    final checkbox2 = RRect.fromRectAndRadius(
      Rect.fromLTWH(6.5 * scale, 16 * scale, 3 * scale, 3 * scale),
      Radius.circular(0.5 * scale),
    );
    canvas.drawRRect(checkbox2, paint);

    final checkbox2Inner = RRect.fromRectAndRadius(
      Rect.fromLTWH(7.5 * scale, 17 * scale, 1 * scale, 1 * scale),
      Radius.circular(0.25 * scale),
    );
    canvas.drawRRect(checkbox2Inner, innerPaint);

    // Line 1
    final line1 = Rect.fromLTWH(13 * scale, 12 * scale, 4 * scale, 1 * scale);
    canvas.drawRect(line1, paint);

    // Line 2
    final line2 = Rect.fromLTWH(13 * scale, 17.5 * scale, 4 * scale, 1 * scale);
    canvas.drawRect(line2, paint);
  }

  @override
  bool shouldRepaint(covariant _HelpCenterIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Report Problem Icon - Flag
/// From: Iconia Pro - 56. Strategy/flag.svg
class ReportProblemIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ReportProblemIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ReportProblemIconPainter(color: color),
    );
  }
}

class _ReportProblemIconPainter extends CustomPainter {
  final Color color;

  _ReportProblemIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Flag shape outer
    final flagOuterPath = Path();
    flagOuterPath.moveTo(19.93 * scale, 12.75 * scale);
    flagOuterPath.cubicTo(19.84 * scale, 12.9 * scale, 19.67 * scale,
        12.99 * scale, 19.49 * scale, 12.99 * scale);
    flagOuterPath.lineTo(8.49 * scale, 12.99 * scale);
    flagOuterPath.cubicTo(8.21 * scale, 12.99 * scale, 7.99 * scale,
        12.76 * scale, 7.99 * scale, 12.49 * scale);
    flagOuterPath.lineTo(7.99 * scale, 4.49 * scale);
    flagOuterPath.cubicTo(7.99 * scale, 4.21 * scale, 8.21 * scale, 3.99 * scale,
        8.49 * scale, 3.99 * scale);
    flagOuterPath.lineTo(19.49 * scale, 3.99 * scale);
    flagOuterPath.cubicTo(19.66 * scale, 3.99 * scale, 19.83 * scale,
        4.08 * scale, 19.92 * scale, 4.23 * scale);
    flagOuterPath.cubicTo(20.01 * scale, 4.38 * scale, 20.01 * scale,
        4.57 * scale, 19.92 * scale, 4.72 * scale);
    flagOuterPath.lineTo(17.85 * scale, 8.47 * scale);
    flagOuterPath.lineTo(19.91 * scale, 12.22 * scale);
    flagOuterPath.cubicTo(19.99 * scale, 12.37 * scale, 19.99 * scale,
        12.56 * scale, 19.92 * scale, 12.71 * scale);
    flagOuterPath.close();

    canvas.drawPath(flagOuterPath, paint);

    // Flag inner cutout (white)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final flagInnerPath = Path();
    flagInnerPath.moveTo(18.65 * scale, 11.99 * scale);
    flagInnerPath.lineTo(16.85 * scale, 8.73 * scale);
    flagInnerPath.cubicTo(16.76 * scale, 8.57 * scale, 16.76 * scale,
        8.39 * scale, 16.85 * scale, 8.24 * scale);
    flagInnerPath.lineTo(18.64 * scale, 4.98 * scale);
    flagInnerPath.lineTo(8.99 * scale, 4.98 * scale);
    flagInnerPath.lineTo(8.99 * scale, 11.98 * scale);
    flagInnerPath.lineTo(18.64 * scale, 11.98 * scale);
    flagInnerPath.close();

    canvas.drawPath(flagInnerPath, innerPaint);

    // Pole
    final polePath = Path();
    polePath.moveTo(9 * scale, 2 * scale);
    polePath.lineTo(9 * scale, 22 * scale);
    polePath.lineTo(8 * scale, 22 * scale);
    polePath.lineTo(8 * scale, 2 * scale);
    polePath.close();

    canvas.drawPath(polePath, paint);
  }

  @override
  bool shouldRepaint(covariant _ReportProblemIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Privacy Policy Icon - Shield with checkmark
/// From: Iconia Pro - 1. User Interface/shield.svg
class PrivacyPolicyIcon extends StatelessWidget {
  final double size;
  final Color color;

  const PrivacyPolicyIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _PrivacyPolicyIconPainter(color: color),
    );
  }
}

class _PrivacyPolicyIconPainter extends CustomPainter {
  final Color color;

  _PrivacyPolicyIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Shield outer path
    final outerPath = Path();
    outerPath.moveTo(11.81 * scale, 1.534 * scale);
    outerPath.cubicTo(11.92 * scale, 1.484 * scale, 12.05 * scale, 1.484 * scale,
        12.17 * scale, 1.534 * scale);
    outerPath.lineTo(21.17 * scale, 5.034 * scale);
    outerPath.cubicTo(21.36 * scale, 5.104 * scale, 21.49 * scale, 5.304 * scale,
        21.48 * scale, 5.514 * scale);
    outerPath.lineTo(21.3 * scale, 10.174 * scale);
    outerPath.cubicTo(21.09 * scale, 15.704 * scale, 17.52 * scale,
        20.554 * scale, 12.3 * scale, 22.404 * scale);
    outerPath.lineTo(12.13 * scale, 22.454 * scale);
    outerPath.cubicTo(12.02 * scale, 22.484 * scale, 11.9 * scale, 22.484 * scale,
        11.79 * scale, 22.454 * scale);
    outerPath.lineTo(11.62 * scale, 22.394 * scale);
    outerPath.cubicTo(6.39 * scale, 20.544 * scale, 2.82 * scale, 15.694 * scale,
        2.62 * scale, 10.154 * scale);
    outerPath.lineTo(2.44 * scale, 5.484 * scale);
    outerPath.cubicTo(2.43 * scale, 5.264 * scale, 2.55 * scale, 5.074 * scale,
        2.75 * scale, 4.994 * scale);
    outerPath.lineTo(11.75 * scale, 1.494 * scale);
    outerPath.close();

    canvas.drawPath(outerPath, paint);

    // Inner cutout (white shield interior)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final innerPath = Path();
    innerPath.moveTo(3.5 * scale, 5.834 * scale);
    innerPath.lineTo(3.65 * scale, 10.134 * scale);
    innerPath.cubicTo(3.83 * scale, 15.254 * scale, 7.14 * scale, 19.744 * scale,
        11.97 * scale, 21.454 * scale);
    innerPath.cubicTo(16.8 * scale, 19.744 * scale, 20.1 * scale, 15.254 * scale,
        20.29 * scale, 10.124 * scale);
    innerPath.lineTo(20.44 * scale, 5.814 * scale);
    innerPath.lineTo(11.95 * scale, 2.504 * scale);
    innerPath.lineTo(3.46 * scale, 5.804 * scale);
    innerPath.close();

    canvas.drawPath(innerPath, innerPaint);

    // Checkmark
    final checkPath = Path();
    checkPath.moveTo(18.35 * scale, 8.35 * scale);
    checkPath.lineTo(10.35 * scale, 16.35 * scale);
    checkPath.cubicTo(10.15 * scale, 16.54 * scale, 9.83 * scale, 16.54 * scale,
        9.64 * scale, 16.35 * scale);
    checkPath.lineTo(6.14 * scale, 12.85 * scale);
    checkPath.lineTo(6.84 * scale, 12.14 * scale);
    checkPath.lineTo(9.98 * scale, 15.28 * scale);
    checkPath.lineTo(17.62 * scale, 7.63 * scale);
    checkPath.lineTo(18.32 * scale, 8.33 * scale);
    checkPath.close();

    canvas.drawPath(checkPath, paint);
  }

  @override
  bool shouldRepaint(covariant _PrivacyPolicyIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
