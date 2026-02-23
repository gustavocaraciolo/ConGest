import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdfx/pdfx.dart';
import 'package:share_plus/share_plus.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/status_badge.dart';
import '../../shared/widgets/thin_icons.dart';

class InvoicePdfScreen extends StatelessWidget {
  final String invoiceId;
  final String description;
  final bool isPaid;

  const InvoicePdfScreen({
    super.key,
    required this.invoiceId,
    required this.description,
    this.isPaid = false,
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
                      // Back button
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
                child: Column(
                  children: [
                    // Merchant header
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 4),
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
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Payment info fields
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      child: Column(
                        children: [
                          // Linha 1: Unidade | Status
                          Row(
                            children: [
                              Expanded(
                                child: _InfoField(
                                  label: 'Unidade',
                                  value: 'Bloco A - Apt 301',
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textTertiary,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    StatusBadge(
                                      label: isPaid ? 'Pago' : 'Pendente',
                                      type: isPaid
                                          ? BadgeType.success
                                          : BadgeType.warning,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Linha 2: Vencimento | Pago em
                          Row(
                            children: [
                              Expanded(
                                child: _InfoField(
                                  label: 'Vencimento',
                                  value: '10 Fev 2026',
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: isPaid
                                    ? _InfoField(
                                        label: 'Pago em',
                                        value: '08 Fev 2026',
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Linha 3: Valor (destaque)
                          _InfoField(
                            label: 'Valor',
                            value: '45.000 Kz',
                            isHighlighted: true,
                          ),

                          const SizedBox(height: 16),

                          // Linha 4: Forma de pagamento
                          _InfoField(
                            label: 'Forma de pagamento',
                            value: isPaid
                                ? 'Transferência Bancária'
                                : '—',
                          ),

                          // Condicional: Entidade e Referência (se NÃO pago)
                          if (!isPaid) ...[
                            const SizedBox(height: 16),
                            const _DashedDivider(),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: _InfoField(
                                    label: 'Entidade',
                                    value: '21100',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _InfoField(
                                    label: 'Referência',
                                    value: '000 123 456 789 012',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Accordion: Detalhes da Factura
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          initiallyExpanded: false,
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          childrenPadding: const EdgeInsets.fromLTRB(
                            16, 0, 16, 16,
                          ),
                          title: Text(
                            'Detalhes da Factura',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          iconColor: AppColors.textSecondary,
                          collapsedIconColor: AppColors.textSecondary,
                          children: [
                            const _DashedDivider(),
                            const SizedBox(height: 12),
                            _AccordionItem(
                              name: 'Quota Mensal',
                              value: '35.000 Kz',
                            ),
                            const SizedBox(height: 8),
                            _AccordionItem(
                              name: 'Água Comum',
                              value: '5.000 Kz',
                            ),
                            const SizedBox(height: 8),
                            _AccordionItem(
                              name: 'Energia Áreas Comuns',
                              value: '3.000 Kz',
                            ),
                            const SizedBox(height: 8),
                            _AccordionItem(
                              name: 'Fundo de Reserva',
                              value: '2.000 Kz',
                            ),
                            const SizedBox(height: 12),
                            const _DashedDivider(),
                            const SizedBox(height: 12),
                            _AccordionItem(
                              name: 'Subtotal',
                              value: '45.000 Kz',
                            ),
                            const SizedBox(height: 8),
                            _AccordionItem(
                              name: 'IVA',
                              value: '0 Kz',
                            ),
                            const SizedBox(height: 8),
                            _AccordionItem(
                              name: 'Taxa de Serviço',
                              value: '0 Kz',
                            ),
                            const SizedBox(height: 8),
                            _AccordionItem(
                              name: 'Desconto',
                              value: '0 Kz',
                            ),
                            const SizedBox(height: 12),
                            const _DashedDivider(),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  '45.000 Kz',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
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

// --- Helper widgets ---

class _InfoField extends StatelessWidget {
  final String label;
  final String value;
  final bool isHighlighted;

  const _InfoField({
    required this.label,
    required this.value,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: isHighlighted ? 20 : 14,
            fontWeight: isHighlighted ? FontWeight.w700 : FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _AccordionItem extends StatelessWidget {
  final String name;
  final String value;

  const _AccordionItem({required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ],
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
