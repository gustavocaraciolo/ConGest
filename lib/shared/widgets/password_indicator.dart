import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';

class PasswordIndicator extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordIndicator({
    super.key,
    required this.text,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isValid ? AppColors.successLight : AppColors.error,
              width: 2,
            ),
          ),
          child: isValid
              ? const Icon(
                  Icons.check,
                  size: 10,
                  color: AppColors.successLight,
                )
              : const Icon(
                  Icons.close,
                  size: 10,
                  color: AppColors.error,
                ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textTertiary,
            height: 1.43,
          ),
        ),
      ],
    );
  }
}

class PasswordValidation {
  static bool hasMinLength(String password) => password.length >= 8;
  static bool hasNumber(String password) => password.contains(RegExp(r'[0-9]'));
  static bool hasUpperOrLower(String password) =>
      password.contains(RegExp(r'[a-z]')) || password.contains(RegExp(r'[A-Z]'));
}
