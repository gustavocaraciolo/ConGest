import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/icon_box.dart';
import '../../shared/widgets/info_row.dart';
import '../../shared/widgets/screen_header.dart';
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
            ScreenHeader(
              title: description,
              subtitle: invoiceId,
              onBack: () => Navigator.of(context).pop(),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => _shareInvoice(context),
                    child: IconBox(
                      color: AppColors.primary,
                      size: 40,
                      borderRadius: 12,
                      child: ThinIcon(
                        painter: ShareIconPainter(color: AppColors.primary),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ConGest',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Gestão de Condomínio',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color:
                                    AppColors.white.withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InfoRow(
                                label: 'Nº da Factura',
                                value: invoiceId,
                              ),
                              const SizedBox(height: 12),
                              InfoRow(
                                label: 'Descrição',
                                value: description,
                              ),
                              const SizedBox(height: 12),
                              const InfoRow(
                                label: 'Condomínio',
                                value: 'Residencial Solar do Atlântico',
                              ),
                              const SizedBox(height: 12),
                              const InfoRow(
                                label: 'Unidade',
                                value: 'Bloco A - Apartamento 302',
                              ),
                              const SizedBox(height: 12),
                              const InfoRow(
                                label: 'Período',
                                value: 'Janeiro 2026',
                              ),
                              const SizedBox(height: 24),
                              Container(
                                height: 1,
                                color: AppColors.divider,
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Itens',
                                style: AppTextStyles.title(),
                              ),
                              const SizedBox(height: 12),
                              const _LineItem(
                                description: 'Quota Mensal',
                                amount: '35.000 Kz',
                              ),
                              const _LineItem(
                                description: 'Água Comum',
                                amount: '5.000 Kz',
                              ),
                              const _LineItem(
                                description: 'Energia Áreas Comuns',
                                amount: '3.000 Kz',
                              ),
                              const _LineItem(
                                description: 'Fundo de Reserva',
                                amount: '2.000 Kz',
                              ),
                              const SizedBox(height: 16),
                              Container(
                                height: 1,
                                color: AppColors.divider,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: AppTextStyles.title(),
                                  ),
                                  Text(
                                    '45.000 Kz',
                                    style: AppTextStyles.amount(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
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
}

class _LineItem extends StatelessWidget {
  final String description;
  final String amount;

  const _LineItem({required this.description, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(description, style: AppTextStyles.body()),
          Text(
            amount,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
