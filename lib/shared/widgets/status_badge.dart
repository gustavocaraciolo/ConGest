import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';

enum BadgeType { success, warning, error, info, neutral }

class StatusBadge extends StatelessWidget {
  final String label;
  final BadgeType type;

  const StatusBadge({
    super.key,
    required this.label,
    this.type = BadgeType.neutral,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: _textColor,
        ),
      ),
    );
  }

  Color get _backgroundColor {
    switch (type) {
      case BadgeType.success:
        return AppColors.success.withValues(alpha: 0.1);
      case BadgeType.warning:
        return AppColors.warning.withValues(alpha: 0.1);
      case BadgeType.error:
        return AppColors.error.withValues(alpha: 0.1);
      case BadgeType.info:
        return AppColors.info.withValues(alpha: 0.1);
      case BadgeType.neutral:
        return AppColors.buttonBackground;
    }
  }

  Color get _textColor {
    switch (type) {
      case BadgeType.success:
        return AppColors.success;
      case BadgeType.warning:
        return const Color(0xFFB45309);
      case BadgeType.error:
        return AppColors.error;
      case BadgeType.info:
        return AppColors.info;
      case BadgeType.neutral:
        return AppColors.textSecondary;
    }
  }
}
