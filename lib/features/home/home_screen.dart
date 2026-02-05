import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/home_icons.dart';
import '../profile/profile_screen.dart';
import 'widgets/balance_card.dart';
import 'widgets/home_bottom_nav.dart';
import 'widgets/service_item.dart';
import 'widgets/transaction_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _currentNavIndex == 3
          ? const ProfileScreen()
          : SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildNavbar(),
                          _buildBalanceSection(),
                          _buildServicesSection(),
                          _buildTransactionsSection(),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: HomeBottomNav(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
        onScanTap: () {
          // Handle QR Code scan
        },
      ),
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
                          'Olá, Gustavo',
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
                      'Bem-vindo ao seu condomínio',
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

  Widget _buildBalanceSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.sectionBackground,
      child: BalanceCard(
        balance: '45.000 Kz',
        onAddMoney: () {
          // Handle pay now
        },
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
                label: 'Pagamentos',
                onTap: () {},
              ),
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
                leadingWidget: const AnnouncementServiceIcon(),
                label: 'Comunicados',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ServiceItem(
                leadingWidget: const InvoiceServiceIcon(),
                label: 'Facturas',
                onTap: () {},
              ),
              ServiceItem(
                leadingWidget: const DocumentServiceIcon(),
                label: 'Documentos',
                onTap: () {},
              ),
              ServiceItem(
                leadingWidget: const ContactServiceIcon(),
                label: 'Contactos',
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

  Widget _buildTransactionsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Movimentos',
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
                onTap: () {
                  // Handle view all
                },
                child: Row(
                  children: const [
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
            title: 'Quota Mensal',
            subtitle: 'Janeiro 2025',
            amount: '25.000 Kz',
            time: '05/01',
            isPositive: false,
            iconBackgroundColor: const Color(0xFFEFF6FF),
            leadingIcon: const HomeTransactionIcon(
              size: 18,
              color: AppColors.navyBlue,
            ),
          ),
          const SizedBox(height: 10),
          TransactionItem(
            title: 'Reserva Salão',
            subtitle: 'Confirmada',
            amount: '15.000 Kz',
            time: '02/01',
            isPositive: false,
            iconBackgroundColor: const Color(0xFFFFF7ED),
            leadingIcon: const EventTransactionIcon(
              size: 18,
              color: Color(0xFFEA580C),
            ),
          ),
          const SizedBox(height: 10),
          TransactionItem(
            title: 'Crédito Conta',
            subtitle: 'Transferência',
            amount: '100.000 Kz',
            time: '28/12',
            isPositive: true,
            iconBackgroundColor: const Color(0xFFECFDF5),
            leadingIcon: const ArrowDownIcon(
              size: 18,
              color: Color(0xFF10B981),
            ),
          ),
        ],
      ),
    );
  }
}
