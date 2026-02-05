import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/status_badge.dart';
import '../../shared/widgets/thin_icons.dart';
import 'invoice_pdf_screen.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: 'Facturas',
              subtitle: 'Consulte as suas facturas mensais',
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _MonthSection(
                    month: 'Fevereiro 2026',
                    invoices: [
                      _InvoiceData(
                        id: 'FAT-2026-02',
                        description: 'Quota Condomínio',
                        amount: '45.000 Kz',
                        dueDate: '10 Fev 2026',
                        isPaid: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _MonthSection(
                    month: 'Janeiro 2026',
                    invoices: [
                      _InvoiceData(
                        id: 'FAT-2026-01',
                        description: 'Quota Condomínio',
                        amount: '45.000 Kz',
                        dueDate: '10 Jan 2026',
                        isPaid: true,
                      ),
                      _InvoiceData(
                        id: 'FAT-2026-01-E',
                        description: 'Taxa Extra - Manutenção Elevador',
                        amount: '20.000 Kz',
                        dueDate: '15 Jan 2026',
                        isPaid: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _MonthSection(
                    month: 'Dezembro 2025',
                    invoices: [
                      _InvoiceData(
                        id: 'FAT-2025-12',
                        description: 'Quota Condomínio',
                        amount: '45.000 Kz',
                        dueDate: '10 Dez 2025',
                        isPaid: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _MonthSection(
                    month: 'Novembro 2025',
                    invoices: [
                      _InvoiceData(
                        id: 'FAT-2025-11',
                        description: 'Quota Condomínio',
                        amount: '45.000 Kz',
                        dueDate: '10 Nov 2025',
                        isPaid: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InvoiceData {
  final String id;
  final String description;
  final String amount;
  final String dueDate;
  final bool isPaid;

  const _InvoiceData({
    required this.id,
    required this.description,
    required this.amount,
    required this.dueDate,
    required this.isPaid,
  });
}

class _MonthSection extends StatelessWidget {
  final String month;
  final List<_InvoiceData> invoices;

  const _MonthSection({required this.month, required this.invoices});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(month, style: AppTextStyles.title()),
        const SizedBox(height: 8),
        ...invoices.map((inv) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _InvoiceCard(invoice: inv),
            )),
      ],
    );
  }
}

class _InvoiceCard extends StatelessWidget {
  final _InvoiceData invoice;

  const _InvoiceCard({required this.invoice});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => InvoicePdfScreen(
              invoiceId: invoice.id,
              description: invoice.description,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: ThinIcon(
                  painter: PdfIconPainter(color: AppColors.primary),
                  size: 22,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    invoice.description,
                    style: AppTextStyles.buttonSecondary(),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Vencimento: ${invoice.dueDate}',
                    style: AppTextStyles.label(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  invoice.amount,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                StatusBadge(
                  label: invoice.isPaid ? 'Pago' : 'Pendente',
                  type: invoice.isPaid ? BadgeType.success : BadgeType.warning,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
