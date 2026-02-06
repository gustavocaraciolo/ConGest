import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_list_tile.dart';
import '../../shared/widgets/icon_box.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/selection_chip.dart';

class FinancesScreen extends StatefulWidget {
  const FinancesScreen({super.key});

  @override
  State<FinancesScreen> createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {
  String _selectedFilter = 'Todos';

  final _filters = ['Todos', 'Entradas', 'Saídas', 'Pendentes'];

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
              subtitle: 'Histórico financeiro do condomínio',
              onBack: showBack ? () => Navigator.of(context).pop() : null,
            ),

            // Summary cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: _SummaryCard(
                      label: 'Receitas',
                      amount: '850.000 Kz',
                      color: AppColors.success,
                      icon: Icons.arrow_upward_rounded,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _SummaryCard(
                      label: 'Despesas',
                      amount: '620.000 Kz',
                      color: AppColors.error,
                      icon: Icons.arrow_downward_rounded,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Filter chips
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _filters.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final filter = _filters[index];
                  return SelectionChip(
                    label: filter,
                    isSelected: filter == _selectedFilter,
                    onTap: () => setState(() => _selectedFilter = filter),
                    borderRadius: 20,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Transactions list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: const [
                  _DateSection(date: 'Hoje'),
                  _TransactionItem(
                    title: 'Pagamento Quota - Apt 302',
                    subtitle: 'Transferência Bancária',
                    amount: '+45.000 Kz',
                    isIncome: true,
                    time: '14:32',
                  ),
                  _TransactionItem(
                    title: 'Serviço de Limpeza',
                    subtitle: 'Prestação de Serviço',
                    amount: '-85.000 Kz',
                    isIncome: false,
                    time: '10:15',
                  ),
                  SizedBox(height: 16),
                  _DateSection(date: 'Ontem'),
                  _TransactionItem(
                    title: 'Pagamento Quota - Apt 105',
                    subtitle: 'Transferência Bancária',
                    amount: '+45.000 Kz',
                    isIncome: true,
                    time: '18:20',
                  ),
                  _TransactionItem(
                    title: 'Manutenção Elevador',
                    subtitle: 'Serviço Técnico',
                    amount: '-120.000 Kz',
                    isIncome: false,
                    time: '09:45',
                  ),
                  _TransactionItem(
                    title: 'Pagamento Quota - Apt 201',
                    subtitle: 'Referência Multicaixa',
                    amount: '+45.000 Kz',
                    isIncome: true,
                    time: '08:30',
                  ),
                  SizedBox(height: 16),
                  _DateSection(date: '01 Fevereiro'),
                  _TransactionItem(
                    title: 'Conta de Energia',
                    subtitle: 'Áreas Comuns',
                    amount: '-180.000 Kz',
                    isIncome: false,
                    time: '12:00',
                  ),
                  _TransactionItem(
                    title: 'Pagamento Quota - Apt 402',
                    subtitle: 'Transferência Bancária',
                    amount: '+45.000 Kz',
                    isIncome: true,
                    time: '07:15',
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String amount;
  final Color color;
  final IconData icon;

  const _SummaryCard({
    required this.label,
    required this.amount,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconBox(
                color: color,
                size: 28,
                borderRadius: 8,
                child: Icon(icon, size: 16, color: color),
              ),
              const SizedBox(width: 8),
              Text(label, style: AppTextStyles.label()),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _DateSection extends StatelessWidget {
  final String date;

  const _DateSection({required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(date, style: AppTextStyles.label()),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final bool isIncome;
  final String time;

  const _TransactionItem({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isIncome,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final color = isIncome ? AppColors.success : AppColors.error;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AppListTile(
        icon: Icon(
          isIncome
              ? Icons.arrow_downward_rounded
              : Icons.arrow_upward_rounded,
          size: 18,
          color: color,
        ),
        iconColor: color,
        title: title,
        subtitle: subtitle,
        padding: const EdgeInsets.all(14),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(time, style: AppTextStyles.label()),
          ],
        ),
      ),
    );
  }
}
