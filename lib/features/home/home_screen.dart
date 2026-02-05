import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/thin_icons.dart';
import '../../shared/widgets/feature_card.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá, Morador',
                            style: AppTextStyles.headingSmall(),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Bloco A • Apt 302',
                            style: AppTextStyles.subtitle(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: ThinIcon(
                          painter: ProfileIconPainter(
                            color: AppColors.primary,
                          ),
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Balance summary card
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primary,
                        Color(0xFF0055CC),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saldo do mês',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '85.000 Kz',
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _BalanceInfo(
                            label: 'Pago',
                            value: '65.000 Kz',
                            icon: Icons.arrow_upward_rounded,
                            iconColor: AppColors.success,
                          ),
                          const SizedBox(width: 24),
                          _BalanceInfo(
                            label: 'Pendente',
                            value: '20.000 Kz',
                            icon: Icons.arrow_downward_rounded,
                            iconColor: AppColors.warning,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Section title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
                child: Text(
                  'Serviços',
                  style: AppTextStyles.title(),
                ),
              ),
            ),

            // Feature grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                delegate: SliverChildListDelegate([
                  FeatureCard(
                    title: 'Facturas',
                    iconPainter: InvoiceIconPainter(color: AppColors.primary),
                    accentColor: AppColors.primary,
                    onTap: () => _navigate(context, const InvoicesScreen()),
                  ),
                  FeatureCard(
                    title: 'Movimentos',
                    iconPainter: FinanceIconPainter(color: AppColors.accentTeal),
                    accentColor: AppColors.accentTeal,
                    onTap: () => _navigate(context, const FinancesScreen()),
                  ),
                  FeatureCard(
                    title: 'Reservas',
                    iconPainter: ReservationIconPainter(
                      color: AppColors.accentPurple,
                    ),
                    accentColor: AppColors.accentPurple,
                    onTap: () => _navigate(context, const ReservationsScreen()),
                  ),
                  FeatureCard(
                    title: 'Comunicados',
                    iconPainter: AnnouncementIconPainter(
                      color: AppColors.accentOrange,
                    ),
                    accentColor: AppColors.accentOrange,
                    badge: '3',
                    onTap: () =>
                        _navigate(context, const AnnouncementsScreen()),
                  ),
                  FeatureCard(
                    title: 'QR Visitante',
                    iconPainter: QrCodeIconPainter(
                      color: AppColors.accentIndigo,
                    ),
                    accentColor: AppColors.accentIndigo,
                    onTap: () => _navigate(context, const VisitorQrScreen()),
                  ),
                  FeatureCard(
                    title: 'Validar QR',
                    iconPainter: QrScanIconPainter(
                      color: AppColors.accentPink,
                    ),
                    accentColor: AppColors.accentPink,
                    onTap: () => _navigate(context, const ValidateQrScreen()),
                  ),
                  FeatureCard(
                    title: 'Encomendas',
                    iconPainter: ParcelIconPainter(
                      color: AppColors.accentAmber,
                    ),
                    accentColor: AppColors.accentAmber,
                    badge: '2',
                    onTap: () => _navigate(context, const ParcelsScreen()),
                  ),
                  FeatureCard(
                    title: 'Ocorrências',
                    iconPainter: IncidentIconPainter(color: AppColors.error),
                    accentColor: AppColors.error,
                    onTap: () => _navigate(context, const IncidentsScreen()),
                  ),
                  FeatureCard(
                    title: 'Contactos',
                    iconPainter: ContactsIconPainter(
                      color: AppColors.accentTeal,
                    ),
                    accentColor: AppColors.accentTeal,
                    onTap: () => _navigate(context, const ContactsScreen()),
                  ),
                  FeatureCard(
                    title: 'Votações',
                    iconPainter: PollIconPainter(color: AppColors.accentPurple),
                    accentColor: AppColors.accentPurple,
                    onTap: () => _navigate(context, const PollsScreen()),
                  ),
                ]),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),
      ),
    );
  }

  void _navigate(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}

class _BalanceInfo extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;

  const _BalanceInfo({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: iconColor),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.white.withValues(alpha: 0.7),
              ),
            ),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
