import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../shared/widgets/nav_icons.dart';

class HomeBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final VoidCallback? onScanTap;

  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.onScanTap,
  });

  @override
  Widget build(BuildContext context) {
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
          // Navigation items
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
                  // Left section
                  Row(
                    children: [
                      _NavItem(
                        leadingWidget: HomeNavIcon(
                          color: currentIndex == 0
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        label: 'Início',
                        isSelected: currentIndex == 0,
                        onTap: () => onTap(0),
                      ),
                      const SizedBox(width: 8),
                      _NavItem(
                        leadingWidget: WalletNavIcon(
                          color: currentIndex == 1
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        label: 'Pagamentos',
                        isSelected: currentIndex == 1,
                        onTap: () => onTap(1),
                      ),
                    ],
                  ),
                  // Space for floating button
                  const SizedBox(width: 54),
                  // Right section
                  Row(
                    children: [
                      _NavItem(
                        leadingWidget: CalendarNavIcon(
                          color: currentIndex == 2
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        label: 'Reservas',
                        isSelected: currentIndex == 2,
                        onTap: () => onTap(2),
                      ),
                      const SizedBox(width: 8),
                      _NavItem(
                        leadingWidget: ProfileNavIcon(
                          color: currentIndex == 3
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        label: 'Perfil',
                        isSelected: currentIndex == 3,
                        onTap: () => onTap(3),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Floating scan button
          Positioned(
            top: -25,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: onScanTap,
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
                  child: const QrScanNavIcon(),
                ),
              ),
            ),
          ),
          // Home indicator
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
}

class _NavItem extends StatelessWidget {
  final IconData? icon;
  final Widget? leadingWidget;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    this.icon,
    this.leadingWidget,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : assert(icon != null || leadingWidget != null,
            'Either icon or leadingWidget must be provided');

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : AppColors.textSecondary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            leadingWidget ??
                Icon(
                  icon,
                  size: 22,
                  color: color,
                ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                height: 1.2,
                color: color,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
