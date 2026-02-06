import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdfx/pdfx.dart';
import 'package:share_plus/share_plus.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/thin_icons.dart';

class InvoicePdfScreen extends StatelessWidget {
  final String invoiceId;
  final String description;

  const InvoicePdfScreen({
    super.key,
    required this.invoiceId,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Back button (CustomAppBar style)
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: Center(
                            child: ThinIcon(
                              painter: ArrowBackIconPainter(
                                color: AppColors.textPrimary,
                                strokeWidth: 2.0,
                              ),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Title + subtitle
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              description,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              invoiceId,
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Share icon
                      GestureDetector(
                        onTap: () => _shareInvoice(context),
                        child: ThinIcon(
                          painter: ShareIconPainter(color: AppColors.primary),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      // Merchant header
                      const SizedBox(height: 8),
                      Text(
                        'Factura de Condomínio',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'CONGEST',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '10 Janeiro 2026',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Dashed divider
                      const _DashedDivider(),
                      const SizedBox(height: 12),

                      // Bill items
                      const _BillItemRow(
                        name: 'Quota Mensal',
                        unitPrice: '35.000 Kz',
                        quantity: 'x1',
                        total: '35.000 Kz',
                      ),
                      const SizedBox(height: 8),
                      const _BillItemRow(
                        name: 'Água Comum',
                        unitPrice: '5.000 Kz',
                        quantity: 'x1',
                        total: '5.000 Kz',
                      ),
                      const SizedBox(height: 8),
                      const _BillItemRow(
                        name: 'Energia Áreas Comuns',
                        unitPrice: '3.000 Kz',
                        quantity: 'x1',
                        total: '3.000 Kz',
                      ),
                      const SizedBox(height: 8),
                      const _BillItemRow(
                        name: 'Fundo de Reserva',
                        unitPrice: '2.000 Kz',
                        quantity: 'x1',
                        total: '2.000 Kz',
                      ),

                      const SizedBox(height: 12),
                      const _DashedDivider(),
                      const SizedBox(height: 12),

                      // Summary section
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          children: [
                            _SummaryRow(
                              label: 'Subtotal',
                              value: '45.000 Kz',
                            ),
                            SizedBox(height: 10),
                            _SummaryRow(label: 'IVA', value: '0 Kz'),
                            SizedBox(height: 10),
                            _SummaryRow(
                              label: 'Taxa de Serviço',
                              value: '0 Kz',
                            ),
                            SizedBox(height: 10),
                            _SummaryRow(label: 'Desconto', value: '0 Kz'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),
                      const _DashedDivider(),
                      const SizedBox(height: 12),

                      // Total amount
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            Text(
                              '45.000 Kz',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
            // "Visualizar Factura" button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: PrimaryButton(
                label: 'Visualizar Factura',
                onPressed: () => _openPdf(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _shareInvoice(BuildContext context) {
    Share.share(
      'Factura $invoiceId - $description\nValor: 45.000 Kz\nConGest - Gestão de Condomínio',
    );
  }

  void _openPdf(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const _PdfViewerScreen(),
      ),
    );
  }
}

class _PdfViewerScreen extends StatefulWidget {
  const _PdfViewerScreen();

  @override
  State<_PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<_PdfViewerScreen> {
  late final PdfControllerPinch _controller;

  @override
  void initState() {
    super.initState();
    _controller = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/extracto_cc_2461.pdf'),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Center(
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(80),
              ),
              child: Center(
                child: ThinIcon(
                  painter: ArrowBackIconPainter(
                    color: AppColors.textPrimary,
                    strokeWidth: 2.0,
                  ),
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'Extracto',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: PdfViewPinch(controller: _controller),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 1,
      child: CustomPaint(painter: _DashedLinePainter()),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFDEDEDE)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 6.0;
    const dashSpace = 4.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BillItemRow extends StatelessWidget {
  final String name;
  final String unitPrice;
  final String quantity;
  final String total;

  const _BillItemRow({
    required this.name,
    required this.unitPrice,
    required this.quantity,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Left column: name + unit price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  unitPrice,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Center: quantity
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              quantity,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          // Right: total
          Text(
            total,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
