import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/thin_icons.dart';
import 'home_screen.dart';
import '../finances/finances_screen.dart';
import '../reservations/reservations_screen.dart';
import '../announcements/announcements_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final _screens = const [
    HomeScreen(),
    FinancesScreen(),
    ReservationsScreen(),
    AnnouncementsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(color: AppColors.divider, width: 1),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  painter: HomeIconPainter(
                    color: _currentIndex == 0
                        ? AppColors.primary
                        : AppColors.textTertiary,
                  ),
                  label: 'Início',
                  isActive: _currentIndex == 0,
                  onTap: () => setState(() => _currentIndex = 0),
                ),
                _NavItem(
                  painter: WalletIconPainter(
                    color: _currentIndex == 1
                        ? AppColors.primary
                        : AppColors.textTertiary,
                  ),
                  label: 'Finanças',
                  isActive: _currentIndex == 1,
                  onTap: () => setState(() => _currentIndex = 1),
                ),
                _NavItem(
                  painter: ReservationIconPainter(
                    color: _currentIndex == 2
                        ? AppColors.primary
                        : AppColors.textTertiary,
                  ),
                  label: 'Reservas',
                  isActive: _currentIndex == 2,
                  onTap: () => setState(() => _currentIndex = 2),
                ),
                _NavItem(
                  painter: AnnouncementIconPainter(
                    color: _currentIndex == 3
                        ? AppColors.primary
                        : AppColors.textTertiary,
                  ),
                  label: 'Avisos',
                  isActive: _currentIndex == 3,
                  onTap: () => setState(() => _currentIndex = 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final ThinIconPainter painter;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.painter,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThinIcon(painter: painter, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.label(
                color: isActive ? AppColors.primary : AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
