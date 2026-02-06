import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import 'app_card.dart';
import 'icon_box.dart';

class AppListTile extends StatelessWidget {
  final Widget icon;
  final Color iconColor;
  final double iconSize;
  final double iconBorderRadius;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Widget? bottom;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  const AppListTile({
    super.key,
    required this.icon,
    required this.iconColor,
    this.iconSize = 40,
    this.iconBorderRadius = 10,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.bottom,
    this.onTap,
    this.padding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: padding ?? const EdgeInsets.all(16),
      borderColor: borderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconBox(
                color: iconColor,
                size: iconSize,
                borderRadius: iconBorderRadius,
                child: icon,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.buttonSecondary(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(subtitle, style: AppTextStyles.label()),
                  ],
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8),
                trailing!,
              ],
            ],
          ),
          if (bottom != null) ...[
            const SizedBox(height: 10),
            bottom!,
          ],
        ],
      ),
    );
  }
}
