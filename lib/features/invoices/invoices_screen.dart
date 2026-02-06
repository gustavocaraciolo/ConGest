import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/date_section_header.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/transaction_card.dart';
import 'invoice_pdf_screen.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  void _openInvoice(String invoiceId, String description) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => InvoicePdfScreen(
          invoiceId: invoiceId,
          description: description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            Builder(
              builder: (context) {
                final showBack = ModalRoute.of(context)?.canPop ?? false;
                return ScreenHeader(
                  title: 'Facturas',
                  centerTitle: true,
                  onBack: showBack ? () => Navigator.of(context).pop() : null,
                );
              },
            ),

            // Invoices list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  const DateSectionHeader(label: 'Fevereiro 2026'),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/receipt.svg',
                      width: 28,
                      height: 28,
                    ),
                    iconBackgroundColor: Colors.transparent,
                    title: 'Quota Condomínio',
                    subtitle: '10 Fev 2026',
                    amount: '45.000 Kz',
                    time: 'Pendente',
                    isIncome: false,
                    onTap: () => _openInvoice('FAT-2026-02', 'Quota Condomínio'),
                  ),

                  const SizedBox(height: 14),
                  const DateSectionHeader(label: 'Janeiro 2026'),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/receipt.svg',
                      width: 28,
                      height: 28,
                    ),
                    iconBackgroundColor: Colors.transparent,
                    title: 'Quota Condomínio',
                    subtitle: '10 Jan 2026',
                    amount: '45.000 Kz',
                    time: 'Pago',
                    isIncome: true,
                    onTap: () => _openInvoice('FAT-2026-01', 'Quota Condomínio'),
                  ),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/receipt.svg',
                      width: 28,
                      height: 28,
                    ),
                    iconBackgroundColor: Colors.transparent,
                    title: 'Taxa Extra - Manutenção Elevador',
                    subtitle: '15 Jan 2026',
                    amount: '20.000 Kz',
                    time: 'Pago',
                    isIncome: true,
                    onTap: () => _openInvoice('FAT-2026-01-E', 'Taxa Extra - Manutenção Elevador'),
                  ),

                  const DateSectionHeader(label: 'Dezembro 2025'),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/receipt.svg',
                      width: 28,
                      height: 28,
                    ),
                    iconBackgroundColor: Colors.transparent,
                    title: 'Quota Condomínio',
                    subtitle: '10 Dez 2025',
                    amount: '45.000 Kz',
                    time: 'Pago',
                    isIncome: true,
                    onTap: () => _openInvoice('FAT-2025-12', 'Quota Condomínio'),
                  ),

                  const SizedBox(height: 14),
                  const DateSectionHeader(label: 'Novembro 2025'),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/receipt.svg',
                      width: 28,
                      height: 28,
                    ),
                    iconBackgroundColor: Colors.transparent,
                    title: 'Quota Condomínio',
                    subtitle: '10 Nov 2025',
                    amount: '45.000 Kz',
                    time: 'Pago',
                    isIncome: true,
                    onTap: () => _openInvoice('FAT-2025-11', 'Quota Condomínio'),
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
