import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/thin_icons.dart';
import 'widgets/service_item.dart';
import 'widgets/transaction_item.dart';

class HomeGestorScreen extends StatefulWidget {
  const HomeGestorScreen({super.key});

  @override
  State<HomeGestorScreen> createState() => _HomeGestorScreenState();
}

class _HomeGestorScreenState extends State<HomeGestorScreen> {
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildNavbar(),
                    _buildSummarySection(),
                    _buildServicesSection(),
                    _buildRecentActivitySection(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildNavbar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      color: AppColors.sectionBackground,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Olá, Gestor',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                            color: AppColors.cardDark,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '👋',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Painel de Administração',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.43,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: const Center(
                  child: NotificationBellIcon(
                    size: 24,
                    color: AppColors.cardDark,
                  ),
                ),
              ),
              Positioned(
                right: 9,
                top: 13,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.sectionBackground,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumo Financeiro',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.4,
                color: AppColors.cardDark,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    'A Receber',
                    '2.450.000 Kz',
                    Icons.trending_up_rounded,
                    const Color(0xFFECFDF5),
                    const Color(0xFF10B981),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSummaryCard(
                    'Em Atraso',
                    '450.000 Kz',
                    Icons.warning_amber_rounded,
                    const Color(0xFFFEF2F2),
                    AppColors.error,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(333),
                  ),
                ),
                child: const Text(
                  'Enviar Cobranças',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    String label,
    String value,
    IconData icon,
    Color backgroundColor,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: iconColor),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.cardDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ServiceItem(
                leadingWidget: const PaymentServiceIcon(),
                label: 'Financeiro',
                onTap: () {},
              ),
              ServiceItem(
                leadingWidget: const ContactServiceIcon(),
                label: 'Moradores',
                onTap: () {},
              ),
              ServiceItem(
                leadingWidget: const AnnouncementServiceIcon(),
                label: 'Comunicados',
                onTap: () {},
              ),
              ServiceItem(
                leadingWidget: const InvoiceServiceIcon(),
                label: 'Cobranças',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ServiceItem(
                leadingWidget: const ReservationServiceIcon(),
                label: 'Reservas',
                onTap: () {},
              ),
              ServiceItem(
                leadingWidget: const IncidentServiceIcon(),
                label: 'Ocorrências',
                onTap: () {},
              ),
              ServiceItem(
                leadingWidget: const FinanceServiceIcon(),
                label: 'Relatórios',
                onTap: () {},
              ),
              ServiceItem(
                leadingWidget: const MoreServiceIcon(),
                label: 'Mais',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivitySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Actividade Recente',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.19,
                  letterSpacing: -0.01 * 16,
                  color: AppColors.textPrimary,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Row(
                  children: [
                    Text(
                      'Ver todos',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.34,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(width: 4),
                    ChevronRightIcon(
                      size: 16,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          TransactionItem(
            title: 'Pagamento Recebido',
            subtitle: 'Apt 101 - João Silva',
            amount: '25.000 Kz',
            time: 'Hoje',
            isPositive: true,
            iconBackgroundColor: const Color(0xFFECFDF5),
            leadingIcon: const ArrowDownIcon(
              size: 18,
              color: Color(0xFF10B981),
            ),
          ),
          const SizedBox(height: 10),
          TransactionItem(
            title: 'Nova Ocorrência',
            subtitle: 'Apt 305 - Elevador',
            amount: 'Aberta',
            time: 'Hoje',
            isPositive: false,
            iconBackgroundColor: const Color(0xFFFFF7ED),
            leadingIcon: const IncidentServiceIcon(
              size: 18,
              color: Color(0xFFEA580C),
            ),
          ),
          const SizedBox(height: 10),
          TransactionItem(
            title: 'Reserva Confirmada',
            subtitle: 'Salão de Festas - 15/02',
            amount: '15.000 Kz',
            time: 'Ontem',
            isPositive: true,
            iconBackgroundColor: const Color(0xFFEFF6FF),
            leadingIcon: const ReservationServiceIcon(
              size: 18,
              color: AppColors.navyBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14374F4F),
            blurRadius: 40,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 75,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildNavItem(
                        leadingWidget: HomeNavIcon(
                          color: _currentNavIndex == 0
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        label: 'Início',
                        isSelected: _currentNavIndex == 0,
                        onTap: () => setState(() => _currentNavIndex = 0),
                      ),
                      const SizedBox(width: 8),
                      _buildNavItem(
                        leadingWidget: ContactServiceIcon(
                          size: 24,
                          color: _currentNavIndex == 1
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        label: 'Moradores',
                        isSelected: _currentNavIndex == 1,
                        onTap: () => setState(() => _currentNavIndex = 1),
                      ),
                    ],
                  ),
                  const SizedBox(width: 54),
                  Row(
                    children: [
                      _buildNavItem(
                        leadingWidget: WalletNavIcon(
                          color: _currentNavIndex == 2
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        label: 'Financeiro',
                        isSelected: _currentNavIndex == 2,
                        onTap: () => setState(() => _currentNavIndex = 2),
                      ),
                      const SizedBox(width: 8),
                      _buildNavItem(
                        leadingWidget: ProfileNavIcon(
                          color: _currentNavIndex == 3
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        label: 'Perfil',
                        isSelected: _currentNavIndex == 3,
                        onTap: () => setState(() => _currentNavIndex = 3),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -25,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // Send announcement
                },
                child: Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const AnnouncementServiceIcon(
                    size: 24,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 134,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.textPrimary,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required Widget leadingWidget,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            leadingWidget,
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                height: 1.4,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
