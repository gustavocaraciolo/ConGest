import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import 'thin_icons.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ThinIconPainter? prefixIcon;
  final int maxLines;
  final Color? backgroundColor;
  final TextAlign textAlign;

  const AppTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.maxLines = 1,
    this.backgroundColor,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: TextField(
        controller: controller,
        style: AppTextStyles.body(),
        maxLines: maxLines,
        textAlign: textAlign,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.body(color: AppColors.textTertiary),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(14),
                  child: ThinIcon(painter: prefixIcon!, size: 18),
                )
              : null,
          prefixIconConstraints: prefixIcon != null
              ? const BoxConstraints(minWidth: 48, minHeight: 48)
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(14),
        ),
      ),
    );
  }
}
