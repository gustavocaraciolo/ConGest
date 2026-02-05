import 'dart:math' as math;
import 'package:flutter/material.dart';

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
class PdfIconPainter extends ThinIconPainter {
  PdfIconPainter({required super.color});

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

    // "PDF" text hint - three small lines
    canvas.drawLine(Offset(s * 0.32, s * 0.48), Offset(s * 0.68, s * 0.48), p);
    canvas.drawLine(Offset(s * 0.32, s * 0.58), Offset(s * 0.68, s * 0.58), p);
    canvas.drawLine(Offset(s * 0.32, s * 0.68), Offset(s * 0.52, s * 0.68), p);
  }
}

// ─── Arrow Back Icon ───
class ArrowBackIconPainter extends ThinIconPainter {
  ArrowBackIconPainter({required super.color});

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
