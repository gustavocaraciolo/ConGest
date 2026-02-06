import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/app_list_tile.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/section_group.dart';
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
                  SectionGroup(
                    title: 'Fevereiro 2026',
                    children: [
                      _InvoiceCard(
                        id: 'FAT-2026-02',
                        description: 'Quota Condomínio',
                        amount: '45.000 Kz',
                        dueDate: '10 Fev 2026',
                        isPaid: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SectionGroup(
                    title: 'Janeiro 2026',
                    children: [
                      _InvoiceCard(
                        id: 'FAT-2026-01',
                        description: 'Quota Condomínio',
                        amount: '45.000 Kz',
                        dueDate: '10 Jan 2026',
                        isPaid: true,
                      ),
                      _InvoiceCard(
                        id: 'FAT-2026-01-E',
                        description: 'Taxa Extra - Manutenção Elevador',
                        amount: '20.000 Kz',
                        dueDate: '15 Jan 2026',
                        isPaid: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SectionGroup(
                    title: 'Dezembro 2025',
                    children: [
                      _InvoiceCard(
                        id: 'FAT-2025-12',
                        description: 'Quota Condomínio',
                        amount: '45.000 Kz',
                        dueDate: '10 Dez 2025',
                        isPaid: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SectionGroup(
                    title: 'Novembro 2025',
                    children: [
                      _InvoiceCard(
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

class _InvoiceCard extends StatelessWidget {
  final String id;
  final String description;
  final String amount;
  final String dueDate;
  final bool isPaid;

  const _InvoiceCard({
    required this.id,
    required this.description,
    required this.amount,
    required this.dueDate,
    required this.isPaid,
  });

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => InvoicePdfScreen(
              invoiceId: id,
              description: description,
            ),
          ),
        );
      },
      icon: ThinIcon(
        painter: PdfIconPainter(color: AppColors.primary),
        size: 22,
      ),
      iconColor: AppColors.primary,
      iconSize: 44,
      iconBorderRadius: 12,
      title: description,
      subtitle: 'Vencimento: $dueDate',
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            amount,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          StatusBadge(
            label: isPaid ? 'Pago' : 'Pendente',
            type: isPaid ? BadgeType.success : BadgeType.warning,
          ),
        ],
      ),
    );
  }
}
