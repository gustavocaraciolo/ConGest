import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/date_section_header.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/transaction_card.dart';

class FinancesScreen extends StatefulWidget {
  const FinancesScreen({super.key});

  @override
  State<FinancesScreen> createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {
  @override
  Widget build(BuildContext context) {
    final showBack = ModalRoute.of(context)?.canPop ?? false;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: 'Movimentos',
              onBack: showBack ? () => Navigator.of(context).pop() : null,
            ),

            // Transactions list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  const DateSectionHeader(label: 'Hoje'),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/cheque.svg',
                      width: 20,
                      height: 20,
                    ),
                    iconBackgroundColor: AppColors.navyBlue.withValues(alpha: 0.1),
                    title: 'Pagamento Quota - Apt 302',
                    subtitle: 'Transferência Bancária',
                    amount: '+45.000 Kz',
                    time: '14:32',
                    isIncome: true,
                  ),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/budget.svg',
                      width: 20,
                      height: 20,
                    ),
                    iconBackgroundColor: AppColors.accentOrange.withValues(alpha: 0.1),
                    title: 'Serviço de Limpeza',
                    subtitle: 'Prestação de Serviço',
                    amount: '-85.000 Kz',
                    time: '10:15',
                    isIncome: false,
                  ),

                  const SizedBox(height: 14),
                  const DateSectionHeader(label: 'Ontem'),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/cheque.svg',
                      width: 20,
                      height: 20,
                    ),
                    iconBackgroundColor: AppColors.navyBlue.withValues(alpha: 0.1),
                    title: 'Pagamento Quota - Apt 105',
                    subtitle: 'Transferência Bancária',
                    amount: '+45.000 Kz',
                    time: '18:20',
                    isIncome: true,
                  ),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/budget.svg',
                      width: 20,
                      height: 20,
                    ),
                    iconBackgroundColor: AppColors.accentPurple.withValues(alpha: 0.1),
                    title: 'Manutenção Elevador',
                    subtitle: 'Serviço Técnico',
                    amount: '-120.000 Kz',
                    time: '09:45',
                    isIncome: false,
                  ),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/cheque.svg',
                      width: 20,
                      height: 20,
                    ),
                    iconBackgroundColor: AppColors.navyBlue.withValues(alpha: 0.1),
                    title: 'Pagamento Quota - Apt 201',
                    subtitle: 'Referência Multicaixa',
                    amount: '+45.000 Kz',
                    time: '08:30',
                    isIncome: true,
                  ),

                  const DateSectionHeader(label: 'Últimos 7 dias'),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/budget.svg',
                      width: 20,
                      height: 20,
                    ),
                    iconBackgroundColor: AppColors.accentTeal.withValues(alpha: 0.1),
                    title: 'Conta de Energia',
                    subtitle: 'Áreas Comuns',
                    amount: '-180.000 Kz',
                    time: '12:00',
                    isIncome: false,
                  ),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/cheque.svg',
                      width: 20,
                      height: 20,
                    ),
                    iconBackgroundColor: AppColors.navyBlue.withValues(alpha: 0.1),
                    title: 'Pagamento Quota - Apt 402',
                    subtitle: 'Transferência Bancária',
                    amount: '+45.000 Kz',
                    time: '07:15',
                    isIncome: true,
                  ),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/cheque.svg',
                      width: 20,
                      height: 20,
                    ),
                    iconBackgroundColor: AppColors.navyBlue.withValues(alpha: 0.1),
                    title: 'Pagamento Quota - Apt 501',
                    subtitle: 'Referência Multicaixa',
                    amount: '+45.000 Kz',
                    time: '15:42',
                    isIncome: true,
                  ),
                  TransactionCard(
                    icon: SvgPicture.asset(
                      'assets/icons/budget.svg',
                      width: 20,
                      height: 20,
                    ),
                    iconBackgroundColor: AppColors.accentOrange.withValues(alpha: 0.1),
                    title: 'Serviço de Segurança',
                    subtitle: 'Prestação de Serviço',
                    amount: '-250.000 Kz',
                    time: '09:00',
                    isIncome: false,
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
