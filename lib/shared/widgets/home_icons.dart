import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

/// Notification Bell Icon
/// From: Iconia Pro - 1. User Interface/notification.svg
class NotificationBellIcon extends StatelessWidget {
  final double size;
  final Color color;

  const NotificationBellIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.cardDark,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _NotificationBellIconPainter(color: color),
    );
  }
}

class _NotificationBellIconPainter extends CustomPainter {
  final Color color;

  _NotificationBellIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 12
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Bell body path
    final bellPath = Path();
    bellPath.moveTo(18 * scale, 8 * scale);
    bellPath.cubicTo(18 * scale, 4.69 * scale, 15.31 * scale, 2 * scale,
        12 * scale, 2 * scale);
    bellPath.cubicTo(8.69 * scale, 2 * scale, 6 * scale, 4.69 * scale,
        6 * scale, 8 * scale);
    bellPath.cubicTo(6 * scale, 15 * scale, 3 * scale, 17 * scale,
        3 * scale, 17 * scale);
    bellPath.lineTo(21 * scale, 17 * scale);
    bellPath.cubicTo(21 * scale, 17 * scale, 18 * scale, 15 * scale,
        18 * scale, 8 * scale);
    bellPath.close();
    canvas.drawPath(bellPath, paint);

    // Bell clapper (bottom)
    final clapperPath = Path();
    clapperPath.moveTo(13.73 * scale, 21 * scale);
    clapperPath.cubicTo(13.55 * scale, 21.34 * scale, 13.27 * scale, 21.62 * scale,
        12.93 * scale, 21.8 * scale);
    clapperPath.cubicTo(12.59 * scale, 21.98 * scale, 12.21 * scale, 22.05 * scale,
        11.83 * scale, 21.99 * scale);
    clapperPath.cubicTo(11.45 * scale, 21.94 * scale, 11.1 * scale, 21.77 * scale,
        10.83 * scale, 21.5 * scale);
    clapperPath.cubicTo(10.56 * scale, 21.24 * scale, 10.39 * scale, 20.89 * scale,
        10.34 * scale, 20.51 * scale);
    canvas.drawPath(clapperPath, paint);
  }

  @override
  bool shouldRepaint(covariant _NotificationBellIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Payment Service Icon - Wallet
/// From: Iconia Pro - 21. Payment/wallet.svg
class PaymentServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const PaymentServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _PaymentServiceIconPainter(color: color),
    );
  }
}

class _PaymentServiceIconPainter extends CustomPainter {
  final Color color;

  _PaymentServiceIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 12
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Wallet body
    final walletPath = Path();
    walletPath.moveTo(20 * scale, 12 * scale);
    walletPath.lineTo(20 * scale, 7 * scale);
    walletPath.cubicTo(20 * scale, 5.9 * scale, 19.1 * scale, 5 * scale,
        18 * scale, 5 * scale);
    walletPath.lineTo(6 * scale, 5 * scale);
    walletPath.cubicTo(4.9 * scale, 5 * scale, 4 * scale, 5.9 * scale,
        4 * scale, 7 * scale);
    walletPath.lineTo(4 * scale, 17 * scale);
    walletPath.cubicTo(4 * scale, 18.1 * scale, 4.9 * scale, 19 * scale,
        6 * scale, 19 * scale);
    walletPath.lineTo(18 * scale, 19 * scale);
    walletPath.cubicTo(19.1 * scale, 19 * scale, 20 * scale, 18.1 * scale,
        20 * scale, 17 * scale);
    walletPath.lineTo(20 * scale, 12 * scale);
    canvas.drawPath(walletPath, paint);

    // Card slot
    final slotPath = Path();
    slotPath.moveTo(20 * scale, 12 * scale);
    slotPath.lineTo(16 * scale, 12 * scale);
    slotPath.cubicTo(14.9 * scale, 12 * scale, 14 * scale, 12.9 * scale,
        14 * scale, 14 * scale);
    slotPath.cubicTo(14 * scale, 15.1 * scale, 14.9 * scale, 16 * scale,
        16 * scale, 16 * scale);
    slotPath.lineTo(20 * scale, 16 * scale);
    canvas.drawPath(slotPath, paint);
  }

  @override
  bool shouldRepaint(covariant _PaymentServiceIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Reservation Service Icon - Calendar
/// From: Iconia Pro - 8. Date _ Time/calendar.svg
class ReservationServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ReservationServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ReservationServiceIconPainter(color: color),
    );
  }
}

class _ReservationServiceIconPainter extends CustomPainter {
  final Color color;

  _ReservationServiceIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 12
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Calendar body
    final bodyPath = Path();
    bodyPath.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(3 * scale, 4 * scale, 18 * scale, 18 * scale),
      Radius.circular(2 * scale),
    ));
    canvas.drawPath(bodyPath, paint);

    // Top pins
    canvas.drawLine(
      Offset(16 * scale, 2 * scale),
      Offset(16 * scale, 6 * scale),
      paint,
    );
    canvas.drawLine(
      Offset(8 * scale, 2 * scale),
      Offset(8 * scale, 6 * scale),
      paint,
    );

    // Horizontal line
    canvas.drawLine(
      Offset(3 * scale, 10 * scale),
      Offset(21 * scale, 10 * scale),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ReservationServiceIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Incident Service Icon - Warning
/// From: Iconia Pro - 1. User Interface/warning.svg
class IncidentServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const IncidentServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _IncidentServiceIconPainter(color: color),
    );
  }
}

class _IncidentServiceIconPainter extends CustomPainter {
  final Color color;

  _IncidentServiceIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 12
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Triangle path
    final trianglePath = Path();
    trianglePath.moveTo(10.29 * scale, 3.86 * scale);
    trianglePath.lineTo(1.82 * scale, 18 * scale);
    trianglePath.cubicTo(1.64 * scale, 18.31 * scale, 1.55 * scale, 18.67 * scale,
        1.55 * scale, 19.03 * scale);
    trianglePath.cubicTo(1.56 * scale, 19.39 * scale, 1.65 * scale, 19.74 * scale,
        1.83 * scale, 20.05 * scale);
    trianglePath.cubicTo(2.01 * scale, 20.36 * scale, 2.27 * scale, 20.62 * scale,
        2.58 * scale, 20.8 * scale);
    trianglePath.cubicTo(2.89 * scale, 20.97 * scale, 3.24 * scale, 21.06 * scale,
        3.6 * scale, 21.06 * scale);
    trianglePath.lineTo(20.54 * scale, 21.06 * scale);
    trianglePath.cubicTo(20.9 * scale, 21.06 * scale, 21.25 * scale, 20.97 * scale,
        21.56 * scale, 20.8 * scale);
    trianglePath.cubicTo(21.87 * scale, 20.62 * scale, 22.13 * scale, 20.36 * scale,
        22.31 * scale, 20.05 * scale);
    trianglePath.cubicTo(22.49 * scale, 19.74 * scale, 22.58 * scale, 19.39 * scale,
        22.59 * scale, 19.03 * scale);
    trianglePath.cubicTo(22.59 * scale, 18.67 * scale, 22.5 * scale, 18.31 * scale,
        22.32 * scale, 18 * scale);
    trianglePath.lineTo(13.85 * scale, 3.86 * scale);
    trianglePath.cubicTo(13.67 * scale, 3.56 * scale, 13.42 * scale, 3.31 * scale,
        13.11 * scale, 3.14 * scale);
    trianglePath.cubicTo(12.8 * scale, 2.97 * scale, 12.45 * scale, 2.88 * scale,
        12.09 * scale, 2.88 * scale);
    trianglePath.cubicTo(11.73 * scale, 2.88 * scale, 11.38 * scale, 2.97 * scale,
        11.07 * scale, 3.14 * scale);
    trianglePath.cubicTo(10.76 * scale, 3.31 * scale, 10.51 * scale, 3.56 * scale,
        10.33 * scale, 3.86 * scale);
    trianglePath.close();
    canvas.drawPath(trianglePath, paint);

    // Exclamation mark
    canvas.drawLine(
      Offset(12 * scale, 9 * scale),
      Offset(12 * scale, 13 * scale),
      paint,
    );

    // Dot
    final dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(12 * scale, 17 * scale), scale * 0.5, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _IncidentServiceIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Announcement Service Icon - Megaphone
/// From: Iconia Pro - 31. Communication/megaphone.svg
class AnnouncementServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const AnnouncementServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _AnnouncementServiceIconPainter(color: color),
    );
  }
}

class _AnnouncementServiceIconPainter extends CustomPainter {
  final Color color;

  _AnnouncementServiceIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 12
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Megaphone body
    final megaphonePath = Path();
    megaphonePath.moveTo(3 * scale, 11 * scale);
    megaphonePath.lineTo(3 * scale, 13 * scale);
    megaphonePath.cubicTo(3 * scale, 14.1 * scale, 3.9 * scale, 15 * scale,
        5 * scale, 15 * scale);
    megaphonePath.lineTo(7 * scale, 15 * scale);
    megaphonePath.lineTo(11 * scale, 19 * scale);
    megaphonePath.lineTo(11 * scale, 5 * scale);
    megaphonePath.lineTo(7 * scale, 9 * scale);
    megaphonePath.lineTo(5 * scale, 9 * scale);
    megaphonePath.cubicTo(3.9 * scale, 9 * scale, 3 * scale, 9.9 * scale,
        3 * scale, 11 * scale);
    megaphonePath.close();
    canvas.drawPath(megaphonePath, paint);

    // Sound waves
    canvas.drawLine(
      Offset(15 * scale, 9 * scale),
      Offset(15 * scale, 15 * scale),
      paint,
    );

    // Extended wave
    final wavePath = Path();
    wavePath.moveTo(19 * scale, 6 * scale);
    wavePath.cubicTo(21 * scale, 8 * scale, 21 * scale, 16 * scale,
        19 * scale, 18 * scale);
    canvas.drawPath(wavePath, paint);
  }

  @override
  bool shouldRepaint(covariant _AnnouncementServiceIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Invoice Service Icon - File Text
/// From: Iconia Pro - 5. Files/file text.svg
class InvoiceServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const InvoiceServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _InvoiceServiceIconPainter(color: color),
    );
  }
}

class _InvoiceServiceIconPainter extends CustomPainter {
  final Color color;

  _InvoiceServiceIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 12
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // File body path
    final filePath = Path();
    filePath.moveTo(14 * scale, 2 * scale);
    filePath.lineTo(6 * scale, 2 * scale);
    filePath.cubicTo(5.47 * scale, 2 * scale, 4.96 * scale, 2.21 * scale,
        4.59 * scale, 2.59 * scale);
    filePath.cubicTo(4.21 * scale, 2.96 * scale, 4 * scale, 3.47 * scale,
        4 * scale, 4 * scale);
    filePath.lineTo(4 * scale, 20 * scale);
    filePath.cubicTo(4 * scale, 20.53 * scale, 4.21 * scale, 21.04 * scale,
        4.59 * scale, 21.41 * scale);
    filePath.cubicTo(4.96 * scale, 21.79 * scale, 5.47 * scale, 22 * scale,
        6 * scale, 22 * scale);
    filePath.lineTo(18 * scale, 22 * scale);
    filePath.cubicTo(18.53 * scale, 22 * scale, 19.04 * scale, 21.79 * scale,
        19.41 * scale, 21.41 * scale);
    filePath.cubicTo(19.79 * scale, 21.04 * scale, 20 * scale, 20.53 * scale,
        20 * scale, 20 * scale);
    filePath.lineTo(20 * scale, 8 * scale);
    filePath.lineTo(14 * scale, 2 * scale);
    filePath.close();
    canvas.drawPath(filePath, paint);

    // Fold corner
    final foldPath = Path();
    foldPath.moveTo(14 * scale, 2 * scale);
    foldPath.lineTo(14 * scale, 8 * scale);
    foldPath.lineTo(20 * scale, 8 * scale);
    canvas.drawPath(foldPath, paint);

    // Text lines
    canvas.drawLine(
      Offset(8 * scale, 13 * scale),
      Offset(16 * scale, 13 * scale),
      paint,
    );
    canvas.drawLine(
      Offset(8 * scale, 17 * scale),
      Offset(16 * scale, 17 * scale),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _InvoiceServiceIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Document Service Icon - Folder
/// From: Iconia Pro - 5. Files/folder.svg
class DocumentServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const DocumentServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _DocumentServiceIconPainter(color: color),
    );
  }
}

class _DocumentServiceIconPainter extends CustomPainter {
  final Color color;

  _DocumentServiceIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 12
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Folder body
    final folderPath = Path();
    folderPath.moveTo(22 * scale, 19 * scale);
    folderPath.cubicTo(22 * scale, 19.53 * scale, 21.79 * scale, 20.04 * scale,
        21.41 * scale, 20.41 * scale);
    folderPath.cubicTo(21.04 * scale, 20.79 * scale, 20.53 * scale, 21 * scale,
        20 * scale, 21 * scale);
    folderPath.lineTo(4 * scale, 21 * scale);
    folderPath.cubicTo(3.47 * scale, 21 * scale, 2.96 * scale, 20.79 * scale,
        2.59 * scale, 20.41 * scale);
    folderPath.cubicTo(2.21 * scale, 20.04 * scale, 2 * scale, 19.53 * scale,
        2 * scale, 19 * scale);
    folderPath.lineTo(2 * scale, 5 * scale);
    folderPath.cubicTo(2 * scale, 4.47 * scale, 2.21 * scale, 3.96 * scale,
        2.59 * scale, 3.59 * scale);
    folderPath.cubicTo(2.96 * scale, 3.21 * scale, 3.47 * scale, 3 * scale,
        4 * scale, 3 * scale);
    folderPath.lineTo(9 * scale, 3 * scale);
    folderPath.lineTo(11 * scale, 6 * scale);
    folderPath.lineTo(20 * scale, 6 * scale);
    folderPath.cubicTo(20.53 * scale, 6 * scale, 21.04 * scale, 6.21 * scale,
        21.41 * scale, 6.59 * scale);
    folderPath.cubicTo(21.79 * scale, 6.96 * scale, 22 * scale, 7.47 * scale,
        22 * scale, 8 * scale);
    folderPath.lineTo(22 * scale, 19 * scale);
    folderPath.close();
    canvas.drawPath(folderPath, paint);
  }

  @override
  bool shouldRepaint(covariant _DocumentServiceIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Contact Service Icon - Phone Call
/// From: Iconia Pro - 31. Communication/phone call.svg
class ContactServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ContactServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ContactServiceIconPainter(color: color),
    );
  }
}

class _ContactServiceIconPainter extends CustomPainter {
  final Color color;

  _ContactServiceIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 12
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Phone path
    final phonePath = Path();
    phonePath.moveTo(22 * scale, 16.92 * scale);
    phonePath.lineTo(22 * scale, 19.92 * scale);
    phonePath.cubicTo(22.01 * scale, 20.19 * scale, 21.96 * scale, 20.46 * scale,
        21.85 * scale, 20.71 * scale);
    phonePath.cubicTo(21.74 * scale, 20.96 * scale, 21.58 * scale, 21.18 * scale,
        21.37 * scale, 21.36 * scale);
    phonePath.cubicTo(21.16 * scale, 21.54 * scale, 20.92 * scale, 21.67 * scale,
        20.66 * scale, 21.74 * scale);
    phonePath.cubicTo(20.4 * scale, 21.81 * scale, 20.12 * scale, 21.82 * scale,
        19.86 * scale, 21.77 * scale);
    phonePath.cubicTo(16.84 * scale, 21.14 * scale, 13.96 * scale, 19.89 * scale,
        11.43 * scale, 18.12 * scale);
    phonePath.cubicTo(9.07 * scale, 16.49 * scale, 7.07 * scale, 14.49 * scale,
        5.44 * scale, 12.13 * scale);
    phonePath.cubicTo(3.65 * scale, 9.58 * scale, 2.4 * scale, 6.68 * scale,
        1.79 * scale, 3.64 * scale);
    phonePath.cubicTo(1.74 * scale, 3.38 * scale, 1.75 * scale, 3.11 * scale,
        1.82 * scale, 2.85 * scale);
    phonePath.cubicTo(1.89 * scale, 2.59 * scale, 2.02 * scale, 2.35 * scale,
        2.2 * scale, 2.14 * scale);
    phonePath.cubicTo(2.38 * scale, 1.93 * scale, 2.61 * scale, 1.77 * scale,
        2.86 * scale, 1.66 * scale);
    phonePath.cubicTo(3.11 * scale, 1.55 * scale, 3.39 * scale, 1.49 * scale,
        3.66 * scale, 1.5 * scale);
    phonePath.lineTo(6.66 * scale, 1.5 * scale);
    phonePath.cubicTo(7.14 * scale, 1.5 * scale, 7.6 * scale, 1.67 * scale,
        7.96 * scale, 1.97 * scale);
    phonePath.cubicTo(8.32 * scale, 2.28 * scale, 8.56 * scale, 2.7 * scale,
        8.63 * scale, 3.17 * scale);
    phonePath.cubicTo(8.76 * scale, 4.11 * scale, 9 * scale, 5.03 * scale,
        9.33 * scale, 5.91 * scale);
    phonePath.cubicTo(9.46 * scale, 6.27 * scale, 9.49 * scale, 6.66 * scale,
        9.41 * scale, 7.03 * scale);
    phonePath.cubicTo(9.32 * scale, 7.4 * scale, 9.13 * scale, 7.74 * scale,
        8.85 * scale, 8 * scale);
    phonePath.lineTo(7.59 * scale, 9.26 * scale);
    phonePath.cubicTo(9.07 * scale, 11.83 * scale, 11.23 * scale, 13.99 * scale,
        13.8 * scale, 15.47 * scale);
    phonePath.lineTo(15.06 * scale, 14.21 * scale);
    phonePath.cubicTo(15.32 * scale, 13.93 * scale, 15.66 * scale, 13.74 * scale,
        16.03 * scale, 13.65 * scale);
    phonePath.cubicTo(16.4 * scale, 13.57 * scale, 16.79 * scale, 13.6 * scale,
        17.15 * scale, 13.73 * scale);
    phonePath.cubicTo(18.03 * scale, 14.06 * scale, 18.95 * scale, 14.3 * scale,
        19.89 * scale, 14.43 * scale);
    phonePath.cubicTo(20.38 * scale, 14.5 * scale, 20.82 * scale, 14.75 * scale,
        21.13 * scale, 15.12 * scale);
    phonePath.cubicTo(21.44 * scale, 15.5 * scale, 21.6 * scale, 15.98 * scale,
        21.58 * scale, 16.47 * scale);
    canvas.drawPath(phonePath, paint);
  }

  @override
  bool shouldRepaint(covariant _ContactServiceIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// More Service Icon - Grid
/// From: Iconia Pro - 1. User Interface/grid.svg
class MoreServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const MoreServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _MoreServiceIconPainter(color: color),
    );
  }
}

class _MoreServiceIconPainter extends CustomPainter {
  final Color color;

  _MoreServiceIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 12
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Top left square
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(3 * scale, 3 * scale, 7 * scale, 7 * scale),
        Radius.circular(2 * scale),
      ),
      paint,
    );

    // Top right square
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(14 * scale, 3 * scale, 7 * scale, 7 * scale),
        Radius.circular(2 * scale),
      ),
      paint,
    );

    // Bottom left square
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(3 * scale, 14 * scale, 7 * scale, 7 * scale),
        Radius.circular(2 * scale),
      ),
      paint,
    );

    // Bottom right square
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(14 * scale, 14 * scale, 7 * scale, 7 * scale),
        Radius.circular(2 * scale),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _MoreServiceIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Home Transaction Icon - Home
/// From: Iconia Pro - 1. User Interface/home.svg
class HomeTransactionIcon extends StatelessWidget {
  final double size;
  final Color color;

  const HomeTransactionIcon({
    super.key,
    this.size = 18,
    this.color = AppColors.navyBlue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _HomeTransactionIconPainter(color: color),
    );
  }
}

class _HomeTransactionIconPainter extends CustomPainter {
  final Color color;

  _HomeTransactionIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 9
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // House outline
    final housePath = Path();
    housePath.moveTo(3 * scale, 9 * scale);
    housePath.lineTo(12 * scale, 2 * scale);
    housePath.lineTo(21 * scale, 9 * scale);
    housePath.lineTo(21 * scale, 20 * scale);
    housePath.cubicTo(21 * scale, 20.53 * scale, 20.79 * scale, 21.04 * scale,
        20.41 * scale, 21.41 * scale);
    housePath.cubicTo(20.04 * scale, 21.79 * scale, 19.53 * scale, 22 * scale,
        19 * scale, 22 * scale);
    housePath.lineTo(5 * scale, 22 * scale);
    housePath.cubicTo(4.47 * scale, 22 * scale, 3.96 * scale, 21.79 * scale,
        3.59 * scale, 21.41 * scale);
    housePath.cubicTo(3.21 * scale, 21.04 * scale, 3 * scale, 20.53 * scale,
        3 * scale, 20 * scale);
    housePath.lineTo(3 * scale, 9 * scale);
    housePath.close();
    canvas.drawPath(housePath, paint);

    // Door
    final doorPath = Path();
    doorPath.moveTo(9 * scale, 22 * scale);
    doorPath.lineTo(9 * scale, 12 * scale);
    doorPath.lineTo(15 * scale, 12 * scale);
    doorPath.lineTo(15 * scale, 22 * scale);
    canvas.drawPath(doorPath, paint);
  }

  @override
  bool shouldRepaint(covariant _HomeTransactionIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Event Transaction Icon - Calendar Check
/// From: Iconia Pro - 8. Date _ Time/calendar check.svg
class EventTransactionIcon extends StatelessWidget {
  final double size;
  final Color color;

  const EventTransactionIcon({
    super.key,
    this.size = 18,
    this.color = const Color(0xFFEA580C),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _EventTransactionIconPainter(color: color),
    );
  }
}

class _EventTransactionIconPainter extends CustomPainter {
  final Color color;

  _EventTransactionIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 9
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Calendar body
    final bodyPath = Path();
    bodyPath.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(3 * scale, 4 * scale, 18 * scale, 18 * scale),
      Radius.circular(2 * scale),
    ));
    canvas.drawPath(bodyPath, paint);

    // Top pins
    canvas.drawLine(
      Offset(16 * scale, 2 * scale),
      Offset(16 * scale, 6 * scale),
      paint,
    );
    canvas.drawLine(
      Offset(8 * scale, 2 * scale),
      Offset(8 * scale, 6 * scale),
      paint,
    );

    // Horizontal line
    canvas.drawLine(
      Offset(3 * scale, 10 * scale),
      Offset(21 * scale, 10 * scale),
      paint,
    );

    // Checkmark
    final checkPath = Path();
    checkPath.moveTo(9 * scale, 15 * scale);
    checkPath.lineTo(11 * scale, 17 * scale);
    checkPath.lineTo(15 * scale, 13 * scale);
    canvas.drawPath(checkPath, paint);
  }

  @override
  bool shouldRepaint(covariant _EventTransactionIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Arrow Down Icon
/// From: Iconia Pro - 11. Arrows/arrow down.svg
class ArrowDownIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ArrowDownIcon({
    super.key,
    this.size = 16,
    this.color = const Color(0xFF10B981),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ArrowDownIconPainter(color: color),
    );
  }
}

class _ArrowDownIconPainter extends CustomPainter {
  final Color color;

  _ArrowDownIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Vertical line
    canvas.drawLine(
      Offset(12 * scale, 5 * scale),
      Offset(12 * scale, 19 * scale),
      paint,
    );

    // Arrow head
    final arrowPath = Path();
    arrowPath.moveTo(19 * scale, 12 * scale);
    arrowPath.lineTo(12 * scale, 19 * scale);
    arrowPath.lineTo(5 * scale, 12 * scale);
    canvas.drawPath(arrowPath, paint);
  }

  @override
  bool shouldRepaint(covariant _ArrowDownIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Arrow Up Icon
/// From: Iconia Pro - 11. Arrows/arrow up.svg
class ArrowUpIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ArrowUpIcon({
    super.key,
    this.size = 16,
    this.color = AppColors.error,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ArrowUpIconPainter(color: color),
    );
  }
}

class _ArrowUpIconPainter extends CustomPainter {
  final Color color;

  _ArrowUpIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Vertical line
    canvas.drawLine(
      Offset(12 * scale, 19 * scale),
      Offset(12 * scale, 5 * scale),
      paint,
    );

    // Arrow head
    final arrowPath = Path();
    arrowPath.moveTo(5 * scale, 12 * scale);
    arrowPath.lineTo(12 * scale, 5 * scale);
    arrowPath.lineTo(19 * scale, 12 * scale);
    canvas.drawPath(arrowPath, paint);
  }

  @override
  bool shouldRepaint(covariant _ArrowUpIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Chevron Right Icon
/// From: Iconia Pro - 11. Arrows/chevron right.svg
class ChevronRightIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ChevronRightIcon({
    super.key,
    this.size = 16,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ChevronRightIconPainter(color: color),
    );
  }
}

class _ChevronRightIconPainter extends CustomPainter {
  final Color color;

  _ChevronRightIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;

    // Chevron path
    final chevronPath = Path();
    chevronPath.moveTo(9 * scale, 18 * scale);
    chevronPath.lineTo(15 * scale, 12 * scale);
    chevronPath.lineTo(9 * scale, 6 * scale);
    canvas.drawPath(chevronPath, paint);
  }

  @override
  bool shouldRepaint(covariant _ChevronRightIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
