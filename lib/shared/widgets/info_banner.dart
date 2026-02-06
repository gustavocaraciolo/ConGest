import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoBanner extends StatelessWidget {
  final String text;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? leading;

  const InfoBanner({
    super.key,
    required this.text,
    this.actionText,
    this.onActionTap,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    const purpleColor = Color(0xFF3A0DFF);

    return Container(
      height: 72,
      margin: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: purpleColor.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: purpleColor.withValues(alpha: 0.06),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF7B7D82),
              ),
            ),
          ),
          if (actionText != null && onActionTap != null) ...[
            const SizedBox(width: 12),
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                actionText!,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: purpleColor,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
