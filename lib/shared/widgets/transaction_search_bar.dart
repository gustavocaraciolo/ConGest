import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import 'thin_icons.dart';

class TransactionSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String placeholder;
  final VoidCallback? onFilterTap;
  final ValueChanged<String>? onChanged;

  const TransactionSearchBar({
    super.key,
    this.controller,
    this.placeholder = 'Pesquisar transações...',
    this.onFilterTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFF2F2F2)),
        ),
        child: Row(
          children: [
            const SizedBox(width: 14),
            ThinIcon(
              painter: SearchIconPainter(color: AppColors.textMuted),
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimary,
                ),
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF4F5159),
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            if (onFilterTap != null) ...[
              GestureDetector(
                onTap: onFilterTap,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: ThinIcon(
                    painter: FilterIconPainter(color: AppColors.textMuted),
                    size: 20,
                  ),
                ),
              ),
            ] else
              const SizedBox(width: 14),
          ],
        ),
      ),
    );
  }
}
