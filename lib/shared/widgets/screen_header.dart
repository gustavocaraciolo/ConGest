import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import 'thin_icons.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onBack;
  final Widget? trailing;
  final bool centerTitle;

  const ScreenHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.onBack,
    this.trailing,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Row(
            children: [
              if (onBack != null) ...[
                GestureDetector(
                  onTap: onBack,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8F8F8),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: ThinIcon(
                        painter: ArrowBackIconPainter(
                          color: AppColors.textPrimary,
                          strokeWidth: 2.0,
                        ),
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.headingSmall(),
                  textAlign: centerTitle && onBack == null ? TextAlign.center : null,
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Padding(
              padding: EdgeInsets.only(left: onBack != null ? 52 : 0),
              child: Text(
                subtitle!,
                style: AppTextStyles.subtitle(),
              ),
            ),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
