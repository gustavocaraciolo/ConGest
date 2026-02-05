import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app/theme/app_colors.dart';

class SettingsItem extends StatelessWidget {
  final IconData? icon;
  final Widget? leadingWidget;
  final String label;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color iconColor;
  final Color textColor;

  const SettingsItem({
    super.key,
    this.icon,
    this.leadingWidget,
    required this.label,
    this.onTap,
    this.trailing,
    this.iconColor = AppColors.textSecondary,
    this.textColor = AppColors.textSecondary,
  }) : assert(icon != null || leadingWidget != null,
            'Either icon or leadingWidget must be provided');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            leadingWidget ??
                Icon(
                  icon,
                  size: 24,
                  color: iconColor,
                ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                  height: 1.43,
                ),
              ),
            ),
            trailing ??
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.textTertiary,
                ),
          ],
        ),
      ),
    );
  }
}
