import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

/// Custom thin-line icon painters for ConGest.
/// All icons use a consistent thin stroke style (1.5px weight).

class ThinIcon extends StatelessWidget {
  final ThinIconPainter painter;
  final double size;

  const ThinIcon({
    super.key,
    required this.painter,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: painter,
    );
  }
}

abstract class ThinIconPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  ThinIconPainter({
    required this.color,
    this.strokeWidth = 1.5,
  });

  Paint get thinPaint => Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  Paint get fillPaint => Paint()
    ..color = color
    ..style = PaintingStyle.fill;

  @override
  bool shouldRepaint(covariant ThinIconPainter oldDelegate) =>
      color != oldDelegate.color;
}

// ─── Invoice / Receipt Icon ───
class InvoiceIconPainter extends ThinIconPainter {
  InvoiceIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Document body
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.18, s * 0.08, s * 0.64, s * 0.84),
      Radius.circular(s * 0.06),
    );
    canvas.drawRRect(rect, p);

    // Lines on document
    canvas.drawLine(
      Offset(s * 0.30, s * 0.30),
      Offset(s * 0.70, s * 0.30),
      p,
    );
    canvas.drawLine(
      Offset(s * 0.30, s * 0.44),
      Offset(s * 0.70, s * 0.44),
      p,
    );
    canvas.drawLine(
      Offset(s * 0.30, s * 0.58),
      Offset(s * 0.55, s * 0.58),
      p,
    );

    // Currency symbol circle at top
    canvas.drawCircle(Offset(s * 0.50, s * 0.76), s * 0.08, p);
    // Euro sign
    final euroPath = Path()
      ..moveTo(s * 0.53, s * 0.72)
      ..cubicTo(s * 0.51, s * 0.71, s * 0.47, s * 0.72, s * 0.46, s * 0.76)
      ..cubicTo(s * 0.46, s * 0.80, s * 0.49, s * 0.81, s * 0.53, s * 0.80);
    canvas.drawPath(euroPath, p);
    canvas.drawLine(
      Offset(s * 0.45, s * 0.76),
      Offset(s * 0.52, s * 0.76),
      p,
    );
  }
}

// ─── Financial Movements Icon ───
class FinanceIconPainter extends ThinIconPainter {
  FinanceIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Chart axes
    canvas.drawLine(Offset(s * 0.15, s * 0.15), Offset(s * 0.15, s * 0.85), p);
    canvas.drawLine(Offset(s * 0.15, s * 0.85), Offset(s * 0.88, s * 0.85), p);

    // Trend line going up
    final trendPath = Path()
      ..moveTo(s * 0.20, s * 0.70)
      ..lineTo(s * 0.38, s * 0.52)
      ..lineTo(s * 0.52, s * 0.60)
      ..lineTo(s * 0.68, s * 0.35)
      ..lineTo(s * 0.82, s * 0.25);
    canvas.drawPath(trendPath, p);

    // Dots on data points
    final dotPaint = fillPaint;
    final points = [
      Offset(s * 0.20, s * 0.70),
      Offset(s * 0.38, s * 0.52),
      Offset(s * 0.52, s * 0.60),
      Offset(s * 0.68, s * 0.35),
      Offset(s * 0.82, s * 0.25),
    ];
    for (final pt in points) {
      canvas.drawCircle(pt, s * 0.025, dotPaint);
    }

    // Arrow tip at the end
    canvas.drawLine(
      Offset(s * 0.82, s * 0.25),
      Offset(s * 0.76, s * 0.28),
      p,
    );
    canvas.drawLine(
      Offset(s * 0.82, s * 0.25),
      Offset(s * 0.82, s * 0.32),
      p,
    );
  }
}

// ─── Reservations / Calendar Icon ───
class ReservationIconPainter extends ThinIconPainter {
  ReservationIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Calendar body
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.12, s * 0.18, s * 0.76, s * 0.72),
      Radius.circular(s * 0.06),
    );
    canvas.drawRRect(rect, p);

    // Top clips
    canvas.drawLine(Offset(s * 0.35, s * 0.10), Offset(s * 0.35, s * 0.28), p);
    canvas.drawLine(Offset(s * 0.65, s * 0.10), Offset(s * 0.65, s * 0.28), p);

    // Horizontal divider line
    canvas.drawLine(Offset(s * 0.12, s * 0.38), Offset(s * 0.88, s * 0.38), p);

    // Check mark in center
    final checkPath = Path()
      ..moveTo(s * 0.38, s * 0.58)
      ..lineTo(s * 0.47, s * 0.68)
      ..lineTo(s * 0.62, s * 0.50);
    canvas.drawPath(checkPath, p);
  }
}

// ─── Churrasqueira / BBQ Grill Icon ───
class ChurrasqueiraIconPainter extends ThinIconPainter {
  ChurrasqueiraIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Grill top (rounded rectangle)
    final grillTop = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.18, s * 0.30, s * 0.64, s * 0.10),
      Radius.circular(s * 0.04),
    );
    canvas.drawRRect(grillTop, p);

    // Grill bars (horizontal lines across the grill)
    canvas.drawLine(Offset(s * 0.26, s * 0.40), Offset(s * 0.74, s * 0.40), p);
    canvas.drawLine(Offset(s * 0.26, s * 0.47), Offset(s * 0.74, s * 0.47), p);
    canvas.drawLine(Offset(s * 0.26, s * 0.54), Offset(s * 0.74, s * 0.54), p);

    // Bowl / body under grill
    final bowlPath = Path()
      ..moveTo(s * 0.20, s * 0.40)
      ..lineTo(s * 0.20, s * 0.54)
      ..cubicTo(s * 0.20, s * 0.64, s * 0.35, s * 0.70, s * 0.50, s * 0.70)
      ..cubicTo(s * 0.65, s * 0.70, s * 0.80, s * 0.64, s * 0.80, s * 0.54)
      ..lineTo(s * 0.80, s * 0.40);
    canvas.drawPath(bowlPath, p);

    // Legs
    canvas.drawLine(Offset(s * 0.30, s * 0.70), Offset(s * 0.25, s * 0.88), p);
    canvas.drawLine(Offset(s * 0.70, s * 0.70), Offset(s * 0.75, s * 0.88), p);

    // Smoke wisps
    final smoke1 = Path()
      ..moveTo(s * 0.35, s * 0.28)
      ..cubicTo(s * 0.33, s * 0.22, s * 0.37, s * 0.16, s * 0.35, s * 0.10);
    canvas.drawPath(smoke1, p);

    final smoke2 = Path()
      ..moveTo(s * 0.50, s * 0.28)
      ..cubicTo(s * 0.48, s * 0.22, s * 0.52, s * 0.16, s * 0.50, s * 0.10);
    canvas.drawPath(smoke2, p);

    final smoke3 = Path()
      ..moveTo(s * 0.65, s * 0.28)
      ..cubicTo(s * 0.63, s * 0.22, s * 0.67, s * 0.16, s * 0.65, s * 0.10);
    canvas.drawPath(smoke3, p);
  }
}

// ─── Salão de Festas / Party Hall Icon ───
class SalaoFestasIconPainter extends ThinIconPainter {
  SalaoFestasIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Party hat (triangle/cone)
    final hatPath = Path()
      ..moveTo(s * 0.50, s * 0.08)
      ..lineTo(s * 0.28, s * 0.62)
      ..lineTo(s * 0.72, s * 0.62)
      ..close();
    canvas.drawPath(hatPath, p);

    // Hat brim (curved line at bottom of hat)
    final brimPath = Path()
      ..moveTo(s * 0.24, s * 0.62)
      ..cubicTo(s * 0.24, s * 0.68, s * 0.76, s * 0.68, s * 0.76, s * 0.62);
    canvas.drawPath(brimPath, p);

    // Hat band / stripe
    canvas.drawLine(Offset(s * 0.36, s * 0.44), Offset(s * 0.64, s * 0.44), p);

    // Pompom at top
    canvas.drawCircle(Offset(s * 0.50, s * 0.08), s * 0.04, fillPaint);

    // Confetti pieces (small dots and lines scattered around)
    canvas.drawCircle(Offset(s * 0.15, s * 0.28), s * 0.02, fillPaint);
    canvas.drawCircle(Offset(s * 0.85, s * 0.22), s * 0.02, fillPaint);
    canvas.drawCircle(Offset(s * 0.78, s * 0.48), s * 0.02, fillPaint);

    // Confetti lines
    canvas.drawLine(Offset(s * 0.12, s * 0.42), Offset(s * 0.17, s * 0.38), p);
    canvas.drawLine(Offset(s * 0.80, s * 0.32), Offset(s * 0.86, s * 0.36), p);
    canvas.drawLine(Offset(s * 0.18, s * 0.55), Offset(s * 0.22, s * 0.50), p);

    // Elastic band under chin
    final elasticPath = Path()
      ..moveTo(s * 0.28, s * 0.62)
      ..cubicTo(s * 0.22, s * 0.72, s * 0.28, s * 0.82, s * 0.38, s * 0.88);
    canvas.drawPath(elasticPath, p);

    final elasticPath2 = Path()
      ..moveTo(s * 0.72, s * 0.62)
      ..cubicTo(s * 0.78, s * 0.72, s * 0.72, s * 0.82, s * 0.62, s * 0.88);
    canvas.drawPath(elasticPath2, p);
  }
}

// ─── Announcements / Megaphone Icon ───
class AnnouncementIconPainter extends ThinIconPainter {
  AnnouncementIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Bell body
    final bellPath = Path()
      ..moveTo(s * 0.25, s * 0.42)
      ..cubicTo(s * 0.25, s * 0.20, s * 0.75, s * 0.20, s * 0.75, s * 0.42)
      ..lineTo(s * 0.78, s * 0.65)
      ..lineTo(s * 0.22, s * 0.65)
      ..close();
    canvas.drawPath(bellPath, p);

    // Top knob
    canvas.drawLine(Offset(s * 0.50, s * 0.12), Offset(s * 0.50, s * 0.20), p);

    // Bottom bar
    canvas.drawLine(Offset(s * 0.18, s * 0.68), Offset(s * 0.82, s * 0.68), p);

    // Clapper
    final clapperPath = Path()
      ..moveTo(s * 0.42, s * 0.72)
      ..cubicTo(s * 0.42, s * 0.82, s * 0.58, s * 0.82, s * 0.58, s * 0.72);
    canvas.drawPath(clapperPath, p);

    // Sound waves
    final wave1 = Path()
      ..moveTo(s * 0.80, s * 0.35)
      ..cubicTo(s * 0.86, s * 0.42, s * 0.86, s * 0.52, s * 0.80, s * 0.58);
    canvas.drawPath(wave1, p);
  }
}

// ─── QR Code Icon ───
class QrCodeIconPainter extends ThinIconPainter {
  QrCodeIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;
    final fillP = fillPaint;

    // Top-left corner pattern
    canvas.drawRect(Rect.fromLTWH(s * 0.12, s * 0.12, s * 0.28, s * 0.28), p);
    canvas.drawRect(Rect.fromLTWH(s * 0.18, s * 0.18, s * 0.16, s * 0.16), fillP);

    // Top-right corner pattern
    canvas.drawRect(Rect.fromLTWH(s * 0.60, s * 0.12, s * 0.28, s * 0.28), p);
    canvas.drawRect(Rect.fromLTWH(s * 0.66, s * 0.18, s * 0.16, s * 0.16), fillP);

    // Bottom-left corner pattern
    canvas.drawRect(Rect.fromLTWH(s * 0.12, s * 0.60, s * 0.28, s * 0.28), p);
    canvas.drawRect(Rect.fromLTWH(s * 0.18, s * 0.66, s * 0.16, s * 0.16), fillP);

    // Small data dots
    canvas.drawRect(Rect.fromLTWH(s * 0.48, s * 0.48, s * 0.08, s * 0.08), fillP);
    canvas.drawRect(Rect.fromLTWH(s * 0.60, s * 0.60, s * 0.08, s * 0.08), fillP);
    canvas.drawRect(Rect.fromLTWH(s * 0.72, s * 0.60, s * 0.08, s * 0.08), fillP);
    canvas.drawRect(Rect.fromLTWH(s * 0.60, s * 0.72, s * 0.08, s * 0.08), fillP);
    canvas.drawRect(Rect.fromLTWH(s * 0.48, s * 0.12, s * 0.06, s * 0.06), fillP);
    canvas.drawRect(Rect.fromLTWH(s * 0.12, s * 0.48, s * 0.06, s * 0.06), fillP);
  }
}

// ─── QR Scan / Validate Icon ───
class QrScanIconPainter extends ThinIconPainter {
  QrScanIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Corner brackets (viewfinder)
    // Top-left
    canvas.drawLine(Offset(s * 0.12, s * 0.28), Offset(s * 0.12, s * 0.12), p);
    canvas.drawLine(Offset(s * 0.12, s * 0.12), Offset(s * 0.28, s * 0.12), p);
    // Top-right
    canvas.drawLine(Offset(s * 0.72, s * 0.12), Offset(s * 0.88, s * 0.12), p);
    canvas.drawLine(Offset(s * 0.88, s * 0.12), Offset(s * 0.88, s * 0.28), p);
    // Bottom-left
    canvas.drawLine(Offset(s * 0.12, s * 0.72), Offset(s * 0.12, s * 0.88), p);
    canvas.drawLine(Offset(s * 0.12, s * 0.88), Offset(s * 0.28, s * 0.88), p);
    // Bottom-right
    canvas.drawLine(Offset(s * 0.72, s * 0.88), Offset(s * 0.88, s * 0.88), p);
    canvas.drawLine(Offset(s * 0.88, s * 0.88), Offset(s * 0.88, s * 0.72), p);

    // Scan line
    final scanPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth * 1.2
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(s * 0.18, s * 0.50), Offset(s * 0.82, s * 0.50), scanPaint);

    // Small QR in center
    canvas.drawRect(
      Rect.fromLTWH(s * 0.35, s * 0.30, s * 0.12, s * 0.12),
      Paint()..color = color..style = PaintingStyle.fill,
    );
    canvas.drawRect(
      Rect.fromLTWH(s * 0.53, s * 0.30, s * 0.12, s * 0.12),
      Paint()..color = color..style = PaintingStyle.fill,
    );
    canvas.drawRect(
      Rect.fromLTWH(s * 0.35, s * 0.58, s * 0.12, s * 0.12),
      Paint()..color = color..style = PaintingStyle.fill,
    );
    canvas.drawRect(
      Rect.fromLTWH(s * 0.53, s * 0.62, s * 0.08, s * 0.08),
      Paint()..color = color..style = PaintingStyle.fill,
    );
  }
}

// ─── Parcel / Box Icon ───
class ParcelIconPainter extends ThinIconPainter {
  ParcelIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Box body
    final boxPath = Path()
      ..moveTo(s * 0.50, s * 0.12)
      ..lineTo(s * 0.88, s * 0.30)
      ..lineTo(s * 0.88, s * 0.70)
      ..lineTo(s * 0.50, s * 0.88)
      ..lineTo(s * 0.12, s * 0.70)
      ..lineTo(s * 0.12, s * 0.30)
      ..close();
    canvas.drawPath(boxPath, p);

    // Middle horizontal line
    canvas.drawLine(Offset(s * 0.12, s * 0.30), Offset(s * 0.50, s * 0.48), p);
    canvas.drawLine(Offset(s * 0.50, s * 0.48), Offset(s * 0.88, s * 0.30), p);

    // Vertical center line
    canvas.drawLine(Offset(s * 0.50, s * 0.48), Offset(s * 0.50, s * 0.88), p);

    // Top ribbon
    canvas.drawLine(Offset(s * 0.31, s * 0.21), Offset(s * 0.50, s * 0.12), p);
    canvas.drawLine(Offset(s * 0.50, s * 0.12), Offset(s * 0.69, s * 0.21), p);
  }
}

// ─── Incident / Warning Icon ───
class IncidentIconPainter extends ThinIconPainter {
  IncidentIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Triangle
    final trianglePath = Path()
      ..moveTo(s * 0.50, s * 0.12)
      ..lineTo(s * 0.88, s * 0.85)
      ..lineTo(s * 0.12, s * 0.85)
      ..close();
    canvas.drawPath(trianglePath, p);

    // Exclamation mark
    canvas.drawLine(Offset(s * 0.50, s * 0.38), Offset(s * 0.50, s * 0.60), p);
    canvas.drawCircle(Offset(s * 0.50, s * 0.72), s * 0.025, fillPaint);
  }
}

// ─── Contacts / Phone Book Icon ───
class ContactsIconPainter extends ThinIconPainter {
  ContactsIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Book body
    final bookRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.20, s * 0.10, s * 0.65, s * 0.80),
      Radius.circular(s * 0.04),
    );
    canvas.drawRRect(bookRect, p);

    // Spine
    canvas.drawLine(Offset(s * 0.20, s * 0.10), Offset(s * 0.20, s * 0.90), p);

    // Binding tabs
    canvas.drawLine(Offset(s * 0.14, s * 0.25), Offset(s * 0.20, s * 0.25), p);
    canvas.drawLine(Offset(s * 0.14, s * 0.50), Offset(s * 0.20, s * 0.50), p);
    canvas.drawLine(Offset(s * 0.14, s * 0.75), Offset(s * 0.20, s * 0.75), p);

    // Person icon
    canvas.drawCircle(Offset(s * 0.52, s * 0.38), s * 0.09, p);
    final personPath = Path()
      ..moveTo(s * 0.38, s * 0.68)
      ..cubicTo(s * 0.38, s * 0.56, s * 0.66, s * 0.56, s * 0.66, s * 0.68);
    canvas.drawPath(personPath, p);
  }
}

// ─── Poll / Vote Icon ───
class PollIconPainter extends ThinIconPainter {
  PollIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;
    final fillP = Paint()
      ..color = color.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    // Bar chart bars
    final bar1 = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.14, s * 0.55, s * 0.18, s * 0.30),
      Radius.circular(s * 0.03),
    );
    canvas.drawRRect(bar1, p);
    canvas.drawRRect(bar1, fillP);

    final bar2 = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.41, s * 0.25, s * 0.18, s * 0.60),
      Radius.circular(s * 0.03),
    );
    canvas.drawRRect(bar2, p);
    canvas.drawRRect(bar2, fillP);

    final bar3 = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.68, s * 0.40, s * 0.18, s * 0.45),
      Radius.circular(s * 0.03),
    );
    canvas.drawRRect(bar3, p);
    canvas.drawRRect(bar3, fillP);

    // Checkmark on tallest bar
    final checkPath = Path()
      ..moveTo(s * 0.45, s * 0.15)
      ..lineTo(s * 0.49, s * 0.20)
      ..lineTo(s * 0.57, s * 0.10);
    canvas.drawPath(checkPath, p);
  }
}

// ─── Home Icon ───
class HomeIconPainter extends ThinIconPainter {
  HomeIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Roof
    final roofPath = Path()
      ..moveTo(s * 0.50, s * 0.12)
      ..lineTo(s * 0.88, s * 0.42)
      ..lineTo(s * 0.78, s * 0.42)
      ..lineTo(s * 0.78, s * 0.85)
      ..lineTo(s * 0.22, s * 0.85)
      ..lineTo(s * 0.22, s * 0.42)
      ..lineTo(s * 0.12, s * 0.42)
      ..close();
    canvas.drawPath(roofPath, p);

    // Door
    canvas.drawRect(
      Rect.fromLTWH(s * 0.40, s * 0.58, s * 0.20, s * 0.27),
      p,
    );
  }
}

// ─── Profile / Person Icon ───
class ProfileIconPainter extends ThinIconPainter {
  ProfileIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Head
    canvas.drawCircle(Offset(s * 0.50, s * 0.32), s * 0.16, p);

    // Body
    final bodyPath = Path()
      ..moveTo(s * 0.18, s * 0.88)
      ..cubicTo(s * 0.18, s * 0.62, s * 0.82, s * 0.62, s * 0.82, s * 0.88);
    canvas.drawPath(bodyPath, p);
  }
}

// ─── Wallet / Money Icon ───
class WalletIconPainter extends ThinIconPainter {
  WalletIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Wallet body
    final walletRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.12, s * 0.22, s * 0.76, s * 0.56),
      Radius.circular(s * 0.06),
    );
    canvas.drawRRect(walletRect, p);

    // Flap
    final flapPath = Path()
      ..moveTo(s * 0.12, s * 0.35)
      ..lineTo(s * 0.12, s * 0.22)
      ..cubicTo(s * 0.12, s * 0.15, s * 0.20, s * 0.15, s * 0.20, s * 0.15)
      ..lineTo(s * 0.75, s * 0.15)
      ..cubicTo(s * 0.82, s * 0.15, s * 0.85, s * 0.20, s * 0.85, s * 0.22);
    canvas.drawPath(flapPath, p);

    // Card slot / clasp
    canvas.drawCircle(Offset(s * 0.75, s * 0.50), s * 0.05, p);
    canvas.drawCircle(Offset(s * 0.75, s * 0.50), s * 0.02, fillPaint);
  }
}

// ─── Share Icon ───
class ShareIconPainter extends ThinIconPainter {
  ShareIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Three nodes
    canvas.drawCircle(Offset(s * 0.72, s * 0.22), s * 0.10, p);
    canvas.drawCircle(Offset(s * 0.28, s * 0.50), s * 0.10, p);
    canvas.drawCircle(Offset(s * 0.72, s * 0.78), s * 0.10, p);

    // Lines connecting nodes
    canvas.drawLine(Offset(s * 0.37, s * 0.44), Offset(s * 0.63, s * 0.28), p);
    canvas.drawLine(Offset(s * 0.37, s * 0.56), Offset(s * 0.63, s * 0.72), p);
  }
}

// ─── PDF / Document Icon ───
// ─── Arrow Back Icon ───
class ArrowBackIconPainter extends ThinIconPainter {
  ArrowBackIconPainter({required super.color, super.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    canvas.drawLine(Offset(s * 0.65, s * 0.20), Offset(s * 0.35, s * 0.50), p);
    canvas.drawLine(Offset(s * 0.35, s * 0.50), Offset(s * 0.65, s * 0.80), p);
  }
}

// ─── Filter Icon ───
class FilterIconPainter extends ThinIconPainter {
  FilterIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    canvas.drawLine(Offset(s * 0.15, s * 0.25), Offset(s * 0.85, s * 0.25), p);
    canvas.drawLine(Offset(s * 0.25, s * 0.50), Offset(s * 0.75, s * 0.50), p);
    canvas.drawLine(Offset(s * 0.35, s * 0.75), Offset(s * 0.65, s * 0.75), p);
  }
}

// ─── Plus Icon ───
class PlusIconPainter extends ThinIconPainter {
  PlusIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    canvas.drawLine(Offset(s * 0.50, s * 0.18), Offset(s * 0.50, s * 0.82), p);
    canvas.drawLine(Offset(s * 0.18, s * 0.50), Offset(s * 0.82, s * 0.50), p);
  }
}

// ─── Clock Icon ───
class ClockIconPainter extends ThinIconPainter {
  ClockIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    canvas.drawCircle(Offset(s * 0.50, s * 0.50), s * 0.40, p);
    canvas.drawLine(Offset(s * 0.50, s * 0.50), Offset(s * 0.50, s * 0.28), p);
    canvas.drawLine(Offset(s * 0.50, s * 0.50), Offset(s * 0.68, s * 0.58), p);
  }
}

// ─── Search Icon ───
class SearchIconPainter extends ThinIconPainter {
  SearchIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    canvas.drawCircle(Offset(s * 0.44, s * 0.44), s * 0.28, p);
    canvas.drawLine(Offset(s * 0.63, s * 0.63), Offset(s * 0.85, s * 0.85), p);
  }
}

// ─── Notification / Bell Icon ───
class NotificationIconPainter extends ThinIconPainter {
  NotificationIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Bell body
    final bellPath = Path()
      ..moveTo(s * 0.25, s * 0.42)
      ..cubicTo(s * 0.25, s * 0.20, s * 0.75, s * 0.20, s * 0.75, s * 0.42)
      ..lineTo(s * 0.78, s * 0.65)
      ..lineTo(s * 0.22, s * 0.65)
      ..close();
    canvas.drawPath(bellPath, p);

    // Top knob
    canvas.drawLine(Offset(s * 0.50, s * 0.12), Offset(s * 0.50, s * 0.20), p);

    // Bottom bar
    canvas.drawLine(Offset(s * 0.18, s * 0.68), Offset(s * 0.82, s * 0.68), p);

    // Clapper
    final clapperPath = Path()
      ..moveTo(s * 0.42, s * 0.72)
      ..cubicTo(s * 0.42, s * 0.82, s * 0.58, s * 0.82, s * 0.58, s * 0.72);
    canvas.drawPath(clapperPath, p);
  }
}

// ─── Grid / More Icon ───
class GridIconPainter extends ThinIconPainter {
  GridIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Top-left square
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(s * 0.12, s * 0.12, s * 0.30, s * 0.30),
        Radius.circular(s * 0.06),
      ),
      p,
    );

    // Top-right square
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(s * 0.58, s * 0.12, s * 0.30, s * 0.30),
        Radius.circular(s * 0.06),
      ),
      p,
    );

    // Bottom-left square
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(s * 0.12, s * 0.58, s * 0.30, s * 0.30),
        Radius.circular(s * 0.06),
      ),
      p,
    );

    // Bottom-right square
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(s * 0.58, s * 0.58, s * 0.30, s * 0.30),
        Radius.circular(s * 0.06),
      ),
      p,
    );
  }
}

// ─── Building Icon ───
class BuildingIconPainter extends ThinIconPainter {
  BuildingIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Building outline
    final buildingPath = Path()
      ..moveTo(s * 0.18, s * 0.88)
      ..lineTo(s * 0.18, s * 0.18)
      ..cubicTo(s * 0.18, s * 0.14, s * 0.22, s * 0.10, s * 0.26, s * 0.10)
      ..lineTo(s * 0.74, s * 0.10)
      ..cubicTo(s * 0.78, s * 0.10, s * 0.82, s * 0.14, s * 0.82, s * 0.18)
      ..lineTo(s * 0.82, s * 0.88);
    canvas.drawPath(buildingPath, p);

    // Bottom line
    canvas.drawLine(Offset(s * 0.10, s * 0.88), Offset(s * 0.90, s * 0.88), p);

    // Windows - row 1 (top)
    canvas.drawLine(Offset(s * 0.32, s * 0.24), Offset(s * 0.32, s * 0.32), p);
    canvas.drawLine(Offset(s * 0.50, s * 0.24), Offset(s * 0.50, s * 0.32), p);
    canvas.drawLine(Offset(s * 0.68, s * 0.24), Offset(s * 0.68, s * 0.32), p);

    // Windows - row 2
    canvas.drawLine(Offset(s * 0.32, s * 0.44), Offset(s * 0.32, s * 0.52), p);
    canvas.drawLine(Offset(s * 0.50, s * 0.44), Offset(s * 0.50, s * 0.52), p);
    canvas.drawLine(Offset(s * 0.68, s * 0.44), Offset(s * 0.68, s * 0.52), p);

    // Door
    final doorPath = Path()
      ..moveTo(s * 0.42, s * 0.88)
      ..lineTo(s * 0.42, s * 0.68)
      ..cubicTo(s * 0.42, s * 0.66, s * 0.44, s * 0.64, s * 0.46, s * 0.64)
      ..lineTo(s * 0.54, s * 0.64)
      ..cubicTo(s * 0.56, s * 0.64, s * 0.58, s * 0.66, s * 0.58, s * 0.68)
      ..lineTo(s * 0.58, s * 0.88);
    canvas.drawPath(doorPath, p);
  }
}

// ─── Chevron Right Icon ───
class ChevronRightIconPainter extends ThinIconPainter {
  ChevronRightIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    canvas.drawLine(Offset(s * 0.35, s * 0.20), Offset(s * 0.65, s * 0.50), p);
    canvas.drawLine(Offset(s * 0.65, s * 0.50), Offset(s * 0.35, s * 0.80), p);
  }
}

// ─── Arrow Down Icon ───
class ArrowDownIconPainter extends ThinIconPainter {
  ArrowDownIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Vertical line
    canvas.drawLine(Offset(s * 0.50, s * 0.20), Offset(s * 0.50, s * 0.80), p);

    // Arrow head
    canvas.drawLine(Offset(s * 0.30, s * 0.60), Offset(s * 0.50, s * 0.80), p);
    canvas.drawLine(Offset(s * 0.50, s * 0.80), Offset(s * 0.70, s * 0.60), p);
  }
}

// ─── Arrow Up Icon ───
class ArrowUpIconPainter extends ThinIconPainter {
  ArrowUpIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Vertical line
    canvas.drawLine(Offset(s * 0.50, s * 0.80), Offset(s * 0.50, s * 0.20), p);

    // Arrow head
    canvas.drawLine(Offset(s * 0.30, s * 0.40), Offset(s * 0.50, s * 0.20), p);
    canvas.drawLine(Offset(s * 0.50, s * 0.20), Offset(s * 0.70, s * 0.40), p);
  }
}

// ─── Globe Icon ───
class GlobeIconPainter extends ThinIconPainter {
  GlobeIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Outer circle
    canvas.drawCircle(Offset(s * 0.50, s * 0.50), s * 0.38, p);

    // Vertical ellipse (meridian)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(s * 0.50, s * 0.50),
        width: s * 0.38,
        height: s * 0.76,
      ),
      p,
    );

    // Horizontal line (equator)
    canvas.drawLine(Offset(s * 0.12, s * 0.50), Offset(s * 0.88, s * 0.50), p);

    // Top latitude line
    canvas.drawLine(Offset(s * 0.22, s * 0.32), Offset(s * 0.78, s * 0.32), p);

    // Bottom latitude line
    canvas.drawLine(Offset(s * 0.22, s * 0.68), Offset(s * 0.78, s * 0.68), p);
  }
}

// ─── Lock Icon ───
class LockIconPainter extends ThinIconPainter {
  LockIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Lock body
    final bodyRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.22, s * 0.42, s * 0.56, s * 0.46),
      Radius.circular(s * 0.06),
    );
    canvas.drawRRect(bodyRect, p);

    // Shackle (U-shape at top)
    final shacklePath = Path()
      ..moveTo(s * 0.30, s * 0.42)
      ..lineTo(s * 0.30, s * 0.32)
      ..cubicTo(s * 0.30, s * 0.18, s * 0.70, s * 0.18, s * 0.70, s * 0.32)
      ..lineTo(s * 0.70, s * 0.42);
    canvas.drawPath(shacklePath, p);

    // Keyhole
    canvas.drawCircle(Offset(s * 0.50, s * 0.58), s * 0.06, p);
    canvas.drawLine(Offset(s * 0.50, s * 0.62), Offset(s * 0.50, s * 0.74), p);
  }
}

// ─── Fingerprint Icon ───
class FingerprintIconPainter extends ThinIconPainter {
  FingerprintIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Outer arc (left side)
    final outerLeftPath = Path()
      ..moveTo(s * 0.20, s * 0.60)
      ..cubicTo(s * 0.20, s * 0.30, s * 0.50, s * 0.15, s * 0.50, s * 0.15);
    canvas.drawPath(outerLeftPath, p);

    // Outer arc (right side)
    final outerRightPath = Path()
      ..moveTo(s * 0.80, s * 0.60)
      ..cubicTo(s * 0.80, s * 0.30, s * 0.50, s * 0.15, s * 0.50, s * 0.15);
    canvas.drawPath(outerRightPath, p);

    // Middle arc
    final middlePath = Path()
      ..moveTo(s * 0.28, s * 0.72)
      ..cubicTo(s * 0.28, s * 0.45, s * 0.50, s * 0.32, s * 0.50, s * 0.32)
      ..cubicTo(s * 0.50, s * 0.32, s * 0.72, s * 0.45, s * 0.72, s * 0.62);
    canvas.drawPath(middlePath, p);

    // Inner arc
    final innerPath = Path()
      ..moveTo(s * 0.38, s * 0.80)
      ..cubicTo(s * 0.38, s * 0.58, s * 0.50, s * 0.48, s * 0.50, s * 0.48)
      ..cubicTo(s * 0.50, s * 0.48, s * 0.62, s * 0.58, s * 0.62, s * 0.68);
    canvas.drawPath(innerPath, p);

    // Center line
    canvas.drawLine(Offset(s * 0.50, s * 0.58), Offset(s * 0.50, s * 0.88), p);
  }
}

// ─── Devices Icon ───
class DevicesIconPainter extends ThinIconPainter {
  DevicesIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Monitor body
    final monitorRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.10, s * 0.12, s * 0.60, s * 0.44),
      Radius.circular(s * 0.04),
    );
    canvas.drawRRect(monitorRect, p);

    // Monitor stand
    canvas.drawLine(Offset(s * 0.40, s * 0.56), Offset(s * 0.40, s * 0.68), p);
    canvas.drawLine(Offset(s * 0.28, s * 0.68), Offset(s * 0.52, s * 0.68), p);

    // Mobile phone
    final phoneRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.58, s * 0.42, s * 0.30, s * 0.48),
      Radius.circular(s * 0.04),
    );
    canvas.drawRRect(phoneRect, p);

    // Phone home indicator
    canvas.drawLine(Offset(s * 0.68, s * 0.82), Offset(s * 0.78, s * 0.82), p);
  }
}

// ─── Palette Icon ───
class PaletteIconPainter extends ThinIconPainter {
  PaletteIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Palette shape
    final palettePath = Path()
      ..moveTo(s * 0.50, s * 0.10)
      ..cubicTo(s * 0.20, s * 0.10, s * 0.08, s * 0.40, s * 0.08, s * 0.55)
      ..cubicTo(s * 0.08, s * 0.85, s * 0.35, s * 0.90, s * 0.50, s * 0.90)
      ..cubicTo(s * 0.56, s * 0.90, s * 0.60, s * 0.86, s * 0.60, s * 0.80)
      ..cubicTo(s * 0.60, s * 0.76, s * 0.58, s * 0.72, s * 0.58, s * 0.72)
      ..cubicTo(s * 0.56, s * 0.70, s * 0.58, s * 0.66, s * 0.62, s * 0.66)
      ..lineTo(s * 0.70, s * 0.66)
      ..cubicTo(s * 0.84, s * 0.66, s * 0.92, s * 0.56, s * 0.92, s * 0.44)
      ..cubicTo(s * 0.92, s * 0.22, s * 0.74, s * 0.10, s * 0.50, s * 0.10)
      ..close();
    canvas.drawPath(palettePath, p);

    // Color dots
    canvas.drawCircle(Offset(s * 0.30, s * 0.42), s * 0.06, p);
    canvas.drawCircle(Offset(s * 0.42, s * 0.28), s * 0.06, p);
    canvas.drawCircle(Offset(s * 0.62, s * 0.28), s * 0.06, p);
    canvas.drawCircle(Offset(s * 0.76, s * 0.42), s * 0.06, p);
  }
}

// ─── Volume Icon ───
class VolumeIconPainter extends ThinIconPainter {
  VolumeIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Speaker body
    final speakerPath = Path()
      ..moveTo(s * 0.12, s * 0.38)
      ..lineTo(s * 0.24, s * 0.38)
      ..lineTo(s * 0.42, s * 0.20)
      ..lineTo(s * 0.42, s * 0.80)
      ..lineTo(s * 0.24, s * 0.62)
      ..lineTo(s * 0.12, s * 0.62)
      ..close();
    canvas.drawPath(speakerPath, p);

    // Sound wave 1 (small)
    final wave1Path = Path()
      ..moveTo(s * 0.52, s * 0.38)
      ..cubicTo(s * 0.58, s * 0.42, s * 0.58, s * 0.58, s * 0.52, s * 0.62);
    canvas.drawPath(wave1Path, p);

    // Sound wave 2 (medium)
    final wave2Path = Path()
      ..moveTo(s * 0.62, s * 0.28)
      ..cubicTo(s * 0.74, s * 0.36, s * 0.74, s * 0.64, s * 0.62, s * 0.72);
    canvas.drawPath(wave2Path, p);

    // Sound wave 3 (large)
    final wave3Path = Path()
      ..moveTo(s * 0.72, s * 0.18)
      ..cubicTo(s * 0.88, s * 0.30, s * 0.88, s * 0.70, s * 0.72, s * 0.82);
    canvas.drawPath(wave3Path, p);
  }
}

// ─── Logout Icon ───
class LogoutIconPainter extends ThinIconPainter {
  LogoutIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Door frame
    final doorPath = Path()
      ..moveTo(s * 0.48, s * 0.12)
      ..lineTo(s * 0.22, s * 0.12)
      ..cubicTo(s * 0.16, s * 0.12, s * 0.12, s * 0.16, s * 0.12, s * 0.22)
      ..lineTo(s * 0.12, s * 0.78)
      ..cubicTo(s * 0.12, s * 0.84, s * 0.16, s * 0.88, s * 0.22, s * 0.88)
      ..lineTo(s * 0.48, s * 0.88);
    canvas.drawPath(doorPath, p);

    // Arrow line
    canvas.drawLine(Offset(s * 0.38, s * 0.50), Offset(s * 0.88, s * 0.50), p);

    // Arrow head
    canvas.drawLine(Offset(s * 0.72, s * 0.34), Offset(s * 0.88, s * 0.50), p);
    canvas.drawLine(Offset(s * 0.88, s * 0.50), Offset(s * 0.72, s * 0.66), p);
  }
}

// ─── FAQ / Question Icon ───
class FaqIconPainter extends ThinIconPainter {
  FaqIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Chat bubble
    final bubblePath = Path()
      ..moveTo(s * 0.50, s * 0.10)
      ..cubicTo(s * 0.22, s * 0.10, s * 0.10, s * 0.28, s * 0.10, s * 0.44)
      ..cubicTo(s * 0.10, s * 0.54, s * 0.16, s * 0.64, s * 0.26, s * 0.70)
      ..lineTo(s * 0.18, s * 0.86)
      ..lineTo(s * 0.38, s * 0.76)
      ..cubicTo(s * 0.42, s * 0.78, s * 0.46, s * 0.78, s * 0.50, s * 0.78)
      ..cubicTo(s * 0.78, s * 0.78, s * 0.90, s * 0.62, s * 0.90, s * 0.44)
      ..cubicTo(s * 0.90, s * 0.28, s * 0.78, s * 0.10, s * 0.50, s * 0.10)
      ..close();
    canvas.drawPath(bubblePath, p);

    // Question mark
    final questionPath = Path()
      ..moveTo(s * 0.42, s * 0.32)
      ..cubicTo(s * 0.42, s * 0.26, s * 0.50, s * 0.24, s * 0.50, s * 0.24)
      ..cubicTo(s * 0.58, s * 0.24, s * 0.60, s * 0.30, s * 0.60, s * 0.36)
      ..cubicTo(s * 0.60, s * 0.42, s * 0.52, s * 0.46, s * 0.50, s * 0.52);
    canvas.drawPath(questionPath, p);

    // Question mark dot
    canvas.drawCircle(Offset(s * 0.50, s * 0.62), s * 0.025, fillPaint);
  }
}

// ─── Help Center / Document Icon ───
class HelpCenterIconPainter extends ThinIconPainter {
  HelpCenterIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Document with folded corner
    final docPath = Path()
      ..moveTo(s * 0.22, s * 0.08)
      ..lineTo(s * 0.62, s * 0.08)
      ..lineTo(s * 0.78, s * 0.24)
      ..lineTo(s * 0.78, s * 0.92)
      ..lineTo(s * 0.22, s * 0.92)
      ..close();
    canvas.drawPath(docPath, p);

    // Folded corner
    final foldPath = Path()
      ..moveTo(s * 0.62, s * 0.08)
      ..lineTo(s * 0.62, s * 0.24)
      ..lineTo(s * 0.78, s * 0.24);
    canvas.drawPath(foldPath, p);

    // Checkbox 1
    canvas.drawRect(Rect.fromLTWH(s * 0.30, s * 0.40, s * 0.12, s * 0.12), p);
    // Checkmark 1
    final check1Path = Path()
      ..moveTo(s * 0.32, s * 0.46)
      ..lineTo(s * 0.36, s * 0.50)
      ..lineTo(s * 0.40, s * 0.43);
    canvas.drawPath(check1Path, p);

    // Line 1
    canvas.drawLine(Offset(s * 0.48, s * 0.46), Offset(s * 0.70, s * 0.46), p);

    // Checkbox 2
    canvas.drawRect(Rect.fromLTWH(s * 0.30, s * 0.60, s * 0.12, s * 0.12), p);

    // Line 2
    canvas.drawLine(Offset(s * 0.48, s * 0.66), Offset(s * 0.70, s * 0.66), p);

    // Checkbox 3
    canvas.drawRect(Rect.fromLTWH(s * 0.30, s * 0.76, s * 0.12, s * 0.12), p);
  }
}

// ─── Flag Icon ───
class FlagIconPainter extends ThinIconPainter {
  FlagIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Pole
    canvas.drawLine(Offset(s * 0.22, s * 0.10), Offset(s * 0.22, s * 0.90), p);

    // Flag
    final flagPath = Path()
      ..moveTo(s * 0.22, s * 0.14)
      ..lineTo(s * 0.78, s * 0.14)
      ..cubicTo(s * 0.82, s * 0.14, s * 0.82, s * 0.20, s * 0.78, s * 0.32)
      ..lineTo(s * 0.72, s * 0.32)
      ..cubicTo(s * 0.76, s * 0.44, s * 0.76, s * 0.50, s * 0.78, s * 0.50)
      ..lineTo(s * 0.22, s * 0.50);
    canvas.drawPath(flagPath, p);
  }
}

// ─── Shield Icon ───
class ShieldIconPainter extends ThinIconPainter {
  ShieldIconPainter({required super.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = thinPaint;
    final s = size.width;

    // Shield shape
    final shieldPath = Path()
      ..moveTo(s * 0.50, s * 0.08)
      ..lineTo(s * 0.86, s * 0.20)
      ..lineTo(s * 0.84, s * 0.50)
      ..cubicTo(s * 0.82, s * 0.70, s * 0.66, s * 0.84, s * 0.50, s * 0.92)
      ..cubicTo(s * 0.34, s * 0.84, s * 0.18, s * 0.70, s * 0.16, s * 0.50)
      ..lineTo(s * 0.14, s * 0.20)
      ..close();
    canvas.drawPath(shieldPath, p);

    // Checkmark
    final checkPath = Path()
      ..moveTo(s * 0.36, s * 0.50)
      ..lineTo(s * 0.46, s * 0.62)
      ..lineTo(s * 0.64, s * 0.38);
    canvas.drawPath(checkPath, p);
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// WRAPPER WIDGETS
// Convenience widgets that wrap ThinIcon + Painter with sensible defaults
// ═══════════════════════════════════════════════════════════════════════════

// ─── Service Icons ───

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
    return ThinIcon(
      painter: InvoiceIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: WalletIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: ReservationIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: IncidentIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: AnnouncementIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: ContactsIconPainter(color: color),
      size: size,
    );
  }
}

class QrCodeServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const QrCodeServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return ThinIcon(
      painter: QrCodeIconPainter(color: color),
      size: size,
    );
  }
}

class QrScanServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const QrScanServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return ThinIcon(
      painter: QrScanIconPainter(color: color),
      size: size,
    );
  }
}

class ParcelServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ParcelServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return ThinIcon(
      painter: ParcelIconPainter(color: color),
      size: size,
    );
  }
}

class PollServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const PollServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return ThinIcon(
      painter: PollIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: GridIconPainter(color: color),
      size: size,
    );
  }
}

class FinanceServiceIcon extends StatelessWidget {
  final double size;
  final Color color;

  const FinanceServiceIcon({
    super.key,
    this.size = 34,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return ThinIcon(
      painter: FinanceIconPainter(color: color),
      size: size,
    );
  }
}

// ─── Navigation Icons ───

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
    return ThinIcon(
      painter: HomeIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: WalletIconPainter(color: color),
      size: size,
    );
  }
}

class InvoiceNavIcon extends StatelessWidget {
  final double size;
  final Color color;

  const InvoiceNavIcon({
    super.key,
    this.size = 22,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return ThinIcon(
      painter: InvoiceIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: ReservationIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: ProfileIconPainter(color: color),
      size: size,
    );
  }
}

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
    return Center(
      child: ThinIcon(
        painter: QrScanIconPainter(color: color),
        size: size,
      ),
    );
  }
}

// ─── Transaction Icons ───

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
    return ThinIcon(
      painter: HomeIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: ReservationIconPainter(color: color),
      size: size,
    );
  }
}

// ─── Utility Icons ───

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
    return ThinIcon(
      painter: NotificationIconPainter(color: color),
      size: size,
    );
  }
}

class BuildingIcon extends StatelessWidget {
  final double size;
  final Color color;

  const BuildingIcon({
    super.key,
    this.size = 20,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return ThinIcon(
      painter: BuildingIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: ChevronRightIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: ArrowDownIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: ArrowUpIconPainter(color: color),
      size: size,
    );
  }
}

// ─── Profile / Settings Icons ───

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
    return ThinIcon(
      painter: ProfileIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: NotificationIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: GlobeIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: LockIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: FingerprintIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: DevicesIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: PaletteIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: VolumeIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: LogoutIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: FaqIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: HelpCenterIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: FlagIconPainter(color: color),
      size: size,
    );
  }
}

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
    return ThinIcon(
      painter: ShieldIconPainter(color: color),
      size: size,
    );
  }
}
