import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class ServiceItem extends StatelessWidget {
  final IconData? icon;
  final Widget? leadingWidget;
  final String label;
  final VoidCallback? onTap;
  final bool isHighlighted;

  const ServiceItem({
    super.key,
    this.icon,
    this.leadingWidget,
    required this.label,
    this.onTap,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72.75,
            height: 72.75,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 27,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: leadingWidget ??
                  Icon(
                    icon,
                    size: 34,
                    color: isHighlighted
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 72.75,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  letterSpacing: -0.01,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
