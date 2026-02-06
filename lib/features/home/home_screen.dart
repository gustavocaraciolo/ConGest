import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/thin_icons.dart';
import '../invoices/invoices_screen.dart';
import '../finances/finances_screen.dart';
import '../reservations/reservations_screen.dart';
import '../announcements/announcements_screen.dart';
import '../visitors/visitor_qr_screen.dart';
import '../visitors/validate_qr_screen.dart';
import '../parcels/parcels_screen.dart';
import '../incidents/incidents_screen.dart';
import '../contacts/contacts_screen.dart';
import '../polls/polls_screen.dart';
import '../profile/profile_screen.dart';
import 'widgets/condominium_selector.dart';
import 'widgets/balance_card.dart';
import 'widgets/service_item.dart';
import 'widgets/transaction_item.dart';
import 'widgets/home_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  final List<Condominium> _condominiums = const [
    Condominium(id: '1', name: 'Edifício Aurora', unit: 'Bloco A • Apt 302'),
    Condominium(id: '2', name: 'Residencial Sol', unit: 'Bloco B • Apt 101'),
  ];

  late Condominium _selectedCondominium;

  @override
  void initState() {
    super.initState();
    _selectedCondominium = _condominiums.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sectionBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: _currentNavIndex == 3
                  ? const ProfileScreen()
                  : _currentNavIndex == 2
                      ? const ReservationsScreen()
                      : _currentNavIndex == 1
                          ? const InvoicesScreen()
                          : _buildHomeContent(),
            ),
            HomeBottomNav(
              currentIndex: _currentNavIndex,
              onTap: (index) => setState(() => _currentNavIndex = index),
              onScanTap: () => _navigate(context, const ValidateQrScreen()),
              profileImageUrl:
                  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop&crop=face',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Navbar
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              children: [
                Expanded(
                  child: CondominiumSelector(
                    selectedCondominium: _selectedCondominium,
                    condominiums: _condominiums,
                    onChanged: (c) => setState(() => _selectedCondominium = c),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to notifications
                  },
                  child: const NotificationBellIcon(
                      size: 24, color: AppColors.cardDark),
                ),
              ],
            ),
          ),

          // BalanceCard section
          Container(
            color: AppColors.sectionBackground,
            padding: const EdgeInsets.all(20),
            child: BalanceCard(
              balance: '45.000 Kz',
              onAddMoney: () => _navigate(context, const InvoicesScreen()),
            ),
          ),

          // Services section
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Serviços',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                    color: AppColors.cardDark,
                  ),
                ),
                const SizedBox(height: 16),
                // Row 1: QR Visitante, Movimentos, Encomendas, Ocorrências
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ServiceItem(
                      leadingWidget: const QrCodeServiceIcon(),
                      label: 'QR Visitante',
                      onTap: () =>
                          _navigate(context, const VisitorQrScreen()),
                    ),
                    ServiceItem(
                      leadingWidget: const PaymentServiceIcon(),
                      label: 'Movimentos',
                      onTap: () => _navigate(context, const FinancesScreen()),
                    ),
                    ServiceItem(
                      leadingWidget: const ParcelServiceIcon(),
                      label: 'Encomendas',
                      onTap: () => _navigate(context, const ParcelsScreen()),
                    ),
                    ServiceItem(
                      leadingWidget: const IncidentServiceIcon(),
                      label: 'Ocorrências',
                      onTap: () => _navigate(context, const IncidentsScreen()),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Row 2: Comunicados, Votações, Contactos, Mais
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ServiceItem(
                      leadingWidget: const AnnouncementServiceIcon(),
                      label: 'Comunicados',
                      onTap: () =>
                          _navigate(context, const AnnouncementsScreen()),
                    ),
                    ServiceItem(
                      leadingWidget: const PollServiceIcon(),
                      label: 'Votações',
                      onTap: () => _navigate(context, const PollsScreen()),
                    ),
                    ServiceItem(
                      leadingWidget: const ContactServiceIcon(),
                      label: 'Contactos',
                      onTap: () => _navigate(context, const ContactsScreen()),
                    ),
                    ServiceItem(
                      leadingWidget: const MoreServiceIcon(),
                      label: 'Mais',
                      onTap: () => _showMoreOptionsSheet(context),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Transactions section
          Container(
            color: AppColors.white,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Movimentos',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                        color: AppColors.cardDark,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _navigate(context, const FinancesScreen()),
                      child: const Row(
                        children: [
                          Text(
                            'Ver',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(width: 4),
                          ChevronRightIcon(size: 16, color: AppColors.primary),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TransactionItem(
                  leadingIcon: const HomeTransactionIcon(
                      size: 18, color: AppColors.white),
                  iconBackgroundColor: AppColors.navyBlue,
                  title: 'Quota Condomínio',
                  subtitle: 'Janeiro',
                  amount: '25.000 Kz',
                  time: '03 Fev',
                  isPositive: false,
                ),
                const SizedBox(height: 12),
                TransactionItem(
                  leadingIcon: const EventTransactionIcon(
                      size: 18, color: AppColors.white),
                  iconBackgroundColor: const Color(0xFFEA580C),
                  title: 'Salão de Festas',
                  subtitle: 'Reserva',
                  amount: '10.000 Kz',
                  time: '28 Jan',
                  isPositive: false,
                ),
              ],
            ),
          ),

          // Bottom padding for nav
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _navigate(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  void _showMoreOptionsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.divider,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Mais Opções',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _MoreOptionItem(
                icon: Icons.qr_code_scanner,
                label: 'Validar QR',
                onTap: () {
                  Navigator.pop(context);
                  _navigate(context, const ValidateQrScreen());
                },
              ),
              _MoreOptionItem(
                icon: Icons.receipt_long_outlined,
                label: 'Facturas',
                onTap: () {
                  Navigator.pop(context);
                  _navigate(context, const InvoicesScreen());
                },
              ),
              _MoreOptionItem(
                icon: Icons.calendar_month_outlined,
                label: 'Reservas',
                onTap: () {
                  Navigator.pop(context);
                  _navigate(context, const ReservationsScreen());
                },
              ),
              _MoreOptionItem(
                icon: Icons.campaign_outlined,
                label: 'Comunicados',
                onTap: () {
                  Navigator.pop(context);
                  _navigate(context, const AnnouncementsScreen());
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoreOptionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MoreOptionItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.sectionBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 20,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            const ChevronRightIcon(size: 16, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
