import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

/// Home Navigation Icon - House
/// From: Iconia Pro - 1. User Interface/home.svg
class HomeNavIcon extends StatelessWidget {
  final double size;
  final Color color;

  const HomeNavIcon({
    super.key,
    this.size = 22,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _HomeNavIconPainter(color: color),
    );
  }
}

class _HomeNavIconPainter extends CustomPainter {
  final Color color;

  _HomeNavIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // House outer path
    final outerPath = Path();
    outerPath.moveTo(12 * scale, 2.1 * scale);
    outerPath.cubicTo(12.35 * scale, 2.1 * scale, 12.68 * scale, 2.23 * scale,
        12.94 * scale, 2.46 * scale);
    outerPath.lineTo(21.44 * scale, 9.96 * scale);
    outerPath.cubicTo(21.79 * scale, 10.27 * scale, 21.99 * scale, 10.72 * scale,
        21.99 * scale, 11.19 * scale);
    outerPath.lineTo(21.99 * scale, 19.99 * scale);
    outerPath.cubicTo(21.99 * scale, 21.09 * scale, 21.09 * scale, 21.99 * scale,
        19.99 * scale, 21.99 * scale);
    outerPath.lineTo(15.99 * scale, 21.99 * scale);
    outerPath.cubicTo(14.89 * scale, 21.99 * scale, 13.99 * scale, 21.09 * scale,
        13.99 * scale, 19.99 * scale);
    outerPath.lineTo(13.99 * scale, 15.99 * scale);
    outerPath.cubicTo(13.99 * scale, 15.71 * scale, 13.77 * scale, 15.49 * scale,
        13.49 * scale, 15.49 * scale);
    outerPath.lineTo(10.49 * scale, 15.49 * scale);
    outerPath.cubicTo(10.21 * scale, 15.49 * scale, 9.99 * scale, 15.71 * scale,
        9.99 * scale, 15.99 * scale);
    outerPath.lineTo(9.99 * scale, 19.99 * scale);
    outerPath.cubicTo(9.99 * scale, 21.09 * scale, 9.09 * scale, 21.99 * scale,
        7.99 * scale, 21.99 * scale);
    outerPath.lineTo(3.99 * scale, 21.99 * scale);
    outerPath.cubicTo(2.89 * scale, 21.99 * scale, 1.99 * scale, 21.09 * scale,
        1.99 * scale, 19.99 * scale);
    outerPath.lineTo(1.99 * scale, 11.19 * scale);
    outerPath.cubicTo(1.99 * scale, 10.72 * scale, 2.19 * scale, 10.27 * scale,
        2.54 * scale, 9.96 * scale);
    outerPath.lineTo(11.04 * scale, 2.46 * scale);
    outerPath.cubicTo(11.3 * scale, 2.23 * scale, 11.63 * scale, 2.1 * scale,
        11.98 * scale, 2.1 * scale);
    outerPath.close();
    canvas.drawPath(outerPath, paint);

    // House inner cutout (white)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final innerPath = Path();
    innerPath.moveTo(12 * scale, 3.1 * scale);
    innerPath.cubicTo(11.89 * scale, 3.1 * scale, 11.79 * scale, 3.14 * scale,
        11.71 * scale, 3.21 * scale);
    innerPath.lineTo(3.21 * scale, 10.71 * scale);
    innerPath.cubicTo(3.07 * scale, 10.84 * scale, 2.99 * scale, 11.01 * scale,
        2.99 * scale, 11.19 * scale);
    innerPath.lineTo(2.99 * scale, 19.99 * scale);
    innerPath.cubicTo(2.99 * scale, 20.54 * scale, 3.44 * scale, 20.99 * scale,
        3.99 * scale, 20.99 * scale);
    innerPath.lineTo(7.99 * scale, 20.99 * scale);
    innerPath.cubicTo(8.54 * scale, 20.99 * scale, 8.99 * scale, 20.54 * scale,
        8.99 * scale, 19.99 * scale);
    innerPath.lineTo(8.99 * scale, 15.99 * scale);
    innerPath.cubicTo(8.99 * scale, 15.16 * scale, 9.66 * scale, 14.49 * scale,
        10.49 * scale, 14.49 * scale);
    innerPath.lineTo(13.49 * scale, 14.49 * scale);
    innerPath.cubicTo(14.32 * scale, 14.49 * scale, 14.99 * scale, 15.16 * scale,
        14.99 * scale, 15.99 * scale);
    innerPath.lineTo(14.99 * scale, 19.99 * scale);
    innerPath.cubicTo(14.99 * scale, 20.54 * scale, 15.44 * scale, 20.99 * scale,
        15.99 * scale, 20.99 * scale);
    innerPath.lineTo(19.99 * scale, 20.99 * scale);
    innerPath.cubicTo(20.54 * scale, 20.99 * scale, 20.99 * scale, 20.54 * scale,
        20.99 * scale, 19.99 * scale);
    innerPath.lineTo(20.99 * scale, 11.19 * scale);
    innerPath.cubicTo(20.99 * scale, 11.01 * scale, 20.91 * scale, 10.84 * scale,
        20.77 * scale, 10.71 * scale);
    innerPath.lineTo(12.27 * scale, 3.21 * scale);
    innerPath.cubicTo(12.19 * scale, 3.14 * scale, 12.09 * scale, 3.1 * scale,
        11.98 * scale, 3.1 * scale);
    innerPath.close();
    canvas.drawPath(innerPath, innerPaint);
  }

  @override
  bool shouldRepaint(covariant _HomeNavIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Wallet Navigation Icon - Wallet
/// From: Iconia Pro - 21. Payment/wallet.svg
class WalletNavIcon extends StatelessWidget {
  final double size;
  final Color color;

  const WalletNavIcon({
    super.key,
    this.size = 22,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _WalletNavIconPainter(color: color),
    );
  }
}

class _WalletNavIconPainter extends CustomPainter {
  final Color color;

  _WalletNavIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Wallet body outer
    final outerPath = Path();
    outerPath.moveTo(2.5 * scale, 7 * scale);
    outerPath.cubicTo(2.5 * scale, 5.07 * scale, 4.07 * scale, 3.5 * scale,
        6 * scale, 3.5 * scale);
    outerPath.lineTo(18 * scale, 3.5 * scale);
    outerPath.cubicTo(19.93 * scale, 3.5 * scale, 21.5 * scale, 5.07 * scale,
        21.5 * scale, 7 * scale);
    outerPath.lineTo(21.5 * scale, 17 * scale);
    outerPath.cubicTo(21.5 * scale, 18.93 * scale, 19.93 * scale, 20.5 * scale,
        18 * scale, 20.5 * scale);
    outerPath.lineTo(6 * scale, 20.5 * scale);
    outerPath.cubicTo(4.07 * scale, 20.5 * scale, 2.5 * scale, 18.93 * scale,
        2.5 * scale, 17 * scale);
    outerPath.lineTo(2.5 * scale, 7 * scale);
    outerPath.close();
    canvas.drawPath(outerPath, paint);

    // Wallet body inner (white)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final innerPath = Path();
    innerPath.moveTo(3.5 * scale, 7 * scale);
    innerPath.cubicTo(3.5 * scale, 5.62 * scale, 4.62 * scale, 4.5 * scale,
        6 * scale, 4.5 * scale);
    innerPath.lineTo(18 * scale, 4.5 * scale);
    innerPath.cubicTo(19.38 * scale, 4.5 * scale, 20.5 * scale, 5.62 * scale,
        20.5 * scale, 7 * scale);
    innerPath.lineTo(20.5 * scale, 17 * scale);
    innerPath.cubicTo(20.5 * scale, 18.38 * scale, 19.38 * scale, 19.5 * scale,
        18 * scale, 19.5 * scale);
    innerPath.lineTo(6 * scale, 19.5 * scale);
    innerPath.cubicTo(4.62 * scale, 19.5 * scale, 3.5 * scale, 18.38 * scale,
        3.5 * scale, 17 * scale);
    innerPath.lineTo(3.5 * scale, 7 * scale);
    innerPath.close();
    canvas.drawPath(innerPath, innerPaint);

    // Card slot outer
    final slotOuterPath = Path();
    slotOuterPath.moveTo(15 * scale, 10.5 * scale);
    slotOuterPath.lineTo(21 * scale, 10.5 * scale);
    slotOuterPath.lineTo(21 * scale, 13.5 * scale);
    slotOuterPath.lineTo(15 * scale, 13.5 * scale);
    slotOuterPath.cubicTo(14.17 * scale, 13.5 * scale, 13.5 * scale, 12.83 * scale,
        13.5 * scale, 12 * scale);
    slotOuterPath.cubicTo(13.5 * scale, 11.17 * scale, 14.17 * scale, 10.5 * scale,
        15 * scale, 10.5 * scale);
    slotOuterPath.close();
    canvas.drawPath(slotOuterPath, paint);

    // Card slot inner (white)
    final slotInnerPath = Path();
    slotInnerPath.moveTo(15 * scale, 11.5 * scale);
    slotInnerPath.lineTo(20 * scale, 11.5 * scale);
    slotInnerPath.lineTo(20 * scale, 12.5 * scale);
    slotInnerPath.lineTo(15 * scale, 12.5 * scale);
    slotInnerPath.cubicTo(14.72 * scale, 12.5 * scale, 14.5 * scale, 12.28 * scale,
        14.5 * scale, 12 * scale);
    slotInnerPath.cubicTo(14.5 * scale, 11.72 * scale, 14.72 * scale, 11.5 * scale,
        15 * scale, 11.5 * scale);
    slotInnerPath.close();
    canvas.drawPath(slotInnerPath, innerPaint);

    // Top line
    final topLinePath = Path();
    topLinePath.moveTo(5 * scale, 7 * scale);
    topLinePath.lineTo(11 * scale, 7 * scale);
    topLinePath.lineTo(11 * scale, 8 * scale);
    topLinePath.lineTo(5 * scale, 8 * scale);
    topLinePath.lineTo(5 * scale, 7 * scale);
    topLinePath.close();
    canvas.drawPath(topLinePath, paint);
  }

  @override
  bool shouldRepaint(covariant _WalletNavIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Calendar Navigation Icon - Calendar
/// From: Iconia Pro - 8. Date _ Time/calendar.svg
class CalendarNavIcon extends StatelessWidget {
  final double size;
  final Color color;

  const CalendarNavIcon({
    super.key,
    this.size = 22,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CalendarNavIconPainter(color: color),
    );
  }
}

class _CalendarNavIconPainter extends CustomPainter {
  final Color color;

  _CalendarNavIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Calendar body outer
    final outerPath = Path();
    outerPath.moveTo(3.5 * scale, 7 * scale);
    outerPath.cubicTo(3.5 * scale, 5.07 * scale, 5.07 * scale, 3.5 * scale,
        7 * scale, 3.5 * scale);
    outerPath.lineTo(17 * scale, 3.5 * scale);
    outerPath.cubicTo(18.93 * scale, 3.5 * scale, 20.5 * scale, 5.07 * scale,
        20.5 * scale, 7 * scale);
    outerPath.lineTo(20.5 * scale, 18 * scale);
    outerPath.cubicTo(20.5 * scale, 19.93 * scale, 18.93 * scale, 21.5 * scale,
        17 * scale, 21.5 * scale);
    outerPath.lineTo(7 * scale, 21.5 * scale);
    outerPath.cubicTo(5.07 * scale, 21.5 * scale, 3.5 * scale, 19.93 * scale,
        3.5 * scale, 18 * scale);
    outerPath.lineTo(3.5 * scale, 7 * scale);
    outerPath.close();
    canvas.drawPath(outerPath, paint);

    // Calendar body inner (white)
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final innerPath = Path();
    innerPath.moveTo(4.5 * scale, 7 * scale);
    innerPath.cubicTo(4.5 * scale, 5.62 * scale, 5.62 * scale, 4.5 * scale,
        7 * scale, 4.5 * scale);
    innerPath.lineTo(17 * scale, 4.5 * scale);
    innerPath.cubicTo(18.38 * scale, 4.5 * scale, 19.5 * scale, 5.62 * scale,
        19.5 * scale, 7 * scale);
    innerPath.lineTo(19.5 * scale, 18 * scale);
    innerPath.cubicTo(19.5 * scale, 19.38 * scale, 18.38 * scale, 20.5 * scale,
        17 * scale, 20.5 * scale);
    innerPath.lineTo(7 * scale, 20.5 * scale);
    innerPath.cubicTo(5.62 * scale, 20.5 * scale, 4.5 * scale, 19.38 * scale,
        4.5 * scale, 18 * scale);
    innerPath.lineTo(4.5 * scale, 7 * scale);
    innerPath.close();
    canvas.drawPath(innerPath, innerPaint);

    // Top bar (header)
    final headerPath = Path();
    headerPath.moveTo(4.5 * scale, 8.5 * scale);
    headerPath.lineTo(19.5 * scale, 8.5 * scale);
    headerPath.lineTo(19.5 * scale, 9.5 * scale);
    headerPath.lineTo(4.5 * scale, 9.5 * scale);
    headerPath.lineTo(4.5 * scale, 8.5 * scale);
    headerPath.close();
    canvas.drawPath(headerPath, paint);

    // Left pin
    final leftPinPath = Path();
    leftPinPath.moveTo(8 * scale, 2 * scale);
    leftPinPath.lineTo(8 * scale, 5 * scale);
    leftPinPath.lineTo(7 * scale, 5 * scale);
    leftPinPath.lineTo(7 * scale, 2 * scale);
    leftPinPath.lineTo(8 * scale, 2 * scale);
    leftPinPath.close();
    canvas.drawPath(leftPinPath, paint);

    // Right pin
    final rightPinPath = Path();
    rightPinPath.moveTo(17 * scale, 2 * scale);
    rightPinPath.lineTo(17 * scale, 5 * scale);
    rightPinPath.lineTo(16 * scale, 5 * scale);
    rightPinPath.lineTo(16 * scale, 2 * scale);
    rightPinPath.lineTo(17 * scale, 2 * scale);
    rightPinPath.close();
    canvas.drawPath(rightPinPath, paint);

    // Calendar dots (grid)
    final dotRadius = 1.0 * scale;

    // Row 1
    canvas.drawCircle(Offset(8 * scale, 13 * scale), dotRadius, paint);
    canvas.drawCircle(Offset(12 * scale, 13 * scale), dotRadius, paint);
    canvas.drawCircle(Offset(16 * scale, 13 * scale), dotRadius, paint);

    // Row 2
    canvas.drawCircle(Offset(8 * scale, 17 * scale), dotRadius, paint);
    canvas.drawCircle(Offset(12 * scale, 17 * scale), dotRadius, paint);
    canvas.drawCircle(Offset(16 * scale, 17 * scale), dotRadius, paint);
  }

  @override
  bool shouldRepaint(covariant _CalendarNavIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Profile Navigation Icon - User silhouette
/// From: Iconia Pro - 22. Users/user.svg
class ProfileNavIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ProfileNavIcon({
    super.key,
    this.size = 22,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ProfileNavIconPainter(color: color),
    );
  }
}

class _ProfileNavIconPainter extends CustomPainter {
  final Color color;

  _ProfileNavIconPainter({required this.color});

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
  bool shouldRepaint(covariant _ProfileNavIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// QR Scan Navigation Icon - QR Code Scanner
/// From: Iconia Pro - 24. Social Media/scan qr code.svg
class QrScanNavIcon extends StatelessWidget {
  final double size;
  final Color color;

  const QrScanNavIcon({
    super.key,
    this.size = 24,
    this.color = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _QrScanNavIconPainter(color: color),
    );
  }
}

class _QrScanNavIconPainter extends CustomPainter {
  final Color color;

  _QrScanNavIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 24;

    // Top left corner bracket
    final tlPath = Path();
    tlPath.moveTo(2 * scale, 7 * scale);
    tlPath.lineTo(2 * scale, 5 * scale);
    tlPath.cubicTo(2 * scale, 3.34 * scale, 3.34 * scale, 2 * scale,
        5 * scale, 2 * scale);
    tlPath.lineTo(7 * scale, 2 * scale);
    tlPath.lineTo(7 * scale, 3 * scale);
    tlPath.lineTo(5 * scale, 3 * scale);
    tlPath.cubicTo(3.9 * scale, 3 * scale, 3 * scale, 3.9 * scale,
        3 * scale, 5 * scale);
    tlPath.lineTo(3 * scale, 7 * scale);
    tlPath.lineTo(2 * scale, 7 * scale);
    tlPath.close();
    canvas.drawPath(tlPath, paint);

    // Top right corner bracket
    final trPath = Path();
    trPath.moveTo(22 * scale, 7 * scale);
    trPath.lineTo(22 * scale, 5 * scale);
    trPath.cubicTo(22 * scale, 3.34 * scale, 20.66 * scale, 2 * scale,
        19 * scale, 2 * scale);
    trPath.lineTo(17 * scale, 2 * scale);
    trPath.lineTo(17 * scale, 3 * scale);
    trPath.lineTo(19 * scale, 3 * scale);
    trPath.cubicTo(20.1 * scale, 3 * scale, 21 * scale, 3.9 * scale,
        21 * scale, 5 * scale);
    trPath.lineTo(21 * scale, 7 * scale);
    trPath.lineTo(22 * scale, 7 * scale);
    trPath.close();
    canvas.drawPath(trPath, paint);

    // Bottom left corner bracket
    final blPath = Path();
    blPath.moveTo(2 * scale, 17 * scale);
    blPath.lineTo(2 * scale, 19 * scale);
    blPath.cubicTo(2 * scale, 20.66 * scale, 3.34 * scale, 22 * scale,
        5 * scale, 22 * scale);
    blPath.lineTo(7 * scale, 22 * scale);
    blPath.lineTo(7 * scale, 21 * scale);
    blPath.lineTo(5 * scale, 21 * scale);
    blPath.cubicTo(3.9 * scale, 21 * scale, 3 * scale, 20.1 * scale,
        3 * scale, 19 * scale);
    blPath.lineTo(3 * scale, 17 * scale);
    blPath.lineTo(2 * scale, 17 * scale);
    blPath.close();
    canvas.drawPath(blPath, paint);

    // Bottom right corner bracket
    final brPath = Path();
    brPath.moveTo(22 * scale, 17 * scale);
    brPath.lineTo(22 * scale, 19 * scale);
    brPath.cubicTo(22 * scale, 20.66 * scale, 20.66 * scale, 22 * scale,
        19 * scale, 22 * scale);
    brPath.lineTo(17 * scale, 22 * scale);
    brPath.lineTo(17 * scale, 21 * scale);
    brPath.lineTo(19 * scale, 21 * scale);
    brPath.cubicTo(20.1 * scale, 21 * scale, 21 * scale, 20.1 * scale,
        21 * scale, 19 * scale);
    brPath.lineTo(21 * scale, 17 * scale);
    brPath.lineTo(22 * scale, 17 * scale);
    brPath.close();
    canvas.drawPath(brPath, paint);

    // QR code grid - top left block
    final tlBlock = RRect.fromRectAndRadius(
      Rect.fromLTWH(5 * scale, 5 * scale, 5 * scale, 5 * scale),
      Radius.circular(1 * scale),
    );
    canvas.drawRRect(tlBlock, paint);

    // QR code grid - top right block
    final trBlock = RRect.fromRectAndRadius(
      Rect.fromLTWH(14 * scale, 5 * scale, 5 * scale, 5 * scale),
      Radius.circular(1 * scale),
    );
    canvas.drawRRect(trBlock, paint);

    // QR code grid - bottom left block
    final blBlock = RRect.fromRectAndRadius(
      Rect.fromLTWH(5 * scale, 14 * scale, 5 * scale, 5 * scale),
      Radius.circular(1 * scale),
    );
    canvas.drawRRect(blBlock, paint);

    // Inner white cutouts for the blocks
    final innerPaint = Paint()
      ..color = color == Colors.white ? const Color(0xFF0077FF) : Colors.white
      ..style = PaintingStyle.fill;

    // Top left inner
    final tlInner = RRect.fromRectAndRadius(
      Rect.fromLTWH(6 * scale, 6 * scale, 3 * scale, 3 * scale),
      Radius.circular(0.5 * scale),
    );
    canvas.drawRRect(tlInner, innerPaint);

    // Top right inner
    final trInner = RRect.fromRectAndRadius(
      Rect.fromLTWH(15 * scale, 6 * scale, 3 * scale, 3 * scale),
      Radius.circular(0.5 * scale),
    );
    canvas.drawRRect(trInner, innerPaint);

    // Bottom left inner
    final blInner = RRect.fromRectAndRadius(
      Rect.fromLTWH(6 * scale, 15 * scale, 3 * scale, 3 * scale),
      Radius.circular(0.5 * scale),
    );
    canvas.drawRRect(blInner, innerPaint);

    // Center dots for each block
    canvas.drawCircle(Offset(7.5 * scale, 7.5 * scale), 0.75 * scale, paint);
    canvas.drawCircle(Offset(16.5 * scale, 7.5 * scale), 0.75 * scale, paint);
    canvas.drawCircle(Offset(7.5 * scale, 16.5 * scale), 0.75 * scale, paint);

    // Bottom right small blocks
    canvas.drawRect(
      Rect.fromLTWH(14 * scale, 14 * scale, 2 * scale, 2 * scale),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(17 * scale, 14 * scale, 2 * scale, 2 * scale),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(14 * scale, 17 * scale, 2 * scale, 2 * scale),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(17 * scale, 17 * scale, 2 * scale, 2 * scale),
      paint,
    );

    // Middle elements
    canvas.drawRect(
      Rect.fromLTWH(11 * scale, 5 * scale, 2 * scale, 2 * scale),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(5 * scale, 11 * scale, 2 * scale, 2 * scale),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(11 * scale, 11 * scale, 2 * scale, 2 * scale),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _QrScanNavIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
