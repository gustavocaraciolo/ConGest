import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import 'primary_button.dart';

class SuccessPopup extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onClose;

  const SuccessPopup({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.onButtonPressed,
    this.onClose,
  });

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String buttonText,
    VoidCallback? onButtonPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      useSafeArea: false,
      builder: (context) => SuccessPopup(
        title: title,
        subtitle: subtitle,
        buttonText: buttonText,
        onButtonPressed: onButtonPressed,
        onClose: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred overlay
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: AppColors.overlayBackground,
            ),
          ),
        ),
        // Popup content
        Center(
          child: Container(
            width: 327,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close button
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: onClose,
                    child: const Icon(
                      Icons.close,
                      size: 24,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Success content (269x147 area)
                SizedBox(
                  width: 269,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon container
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 48,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Text container (269x54, gap 4px)
                      SizedBox(
                        width: 269,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Title
                            Text(
                              title,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2FBF94),
                                height: 28 / 20,
                                decoration: TextDecoration.none,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            // Subtitle
                            Text(
                              subtitle,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF4F5159),
                                height: 22 / 16,
                                decoration: TextDecoration.none,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Button
                PrimaryButton(
                  label: buttonText,
                  onPressed: onButtonPressed ?? onClose,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
