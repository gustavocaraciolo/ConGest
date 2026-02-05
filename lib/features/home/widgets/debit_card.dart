import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class DebitCard extends StatelessWidget {
  final String cardNumber;
  final String holderName;
  final String expiryDate;
  final bool isDark;
  final String? logoText;

  const DebitCard({
    super.key,
    required this.cardNumber,
    required this.holderName,
    required this.expiryDate,
    this.isDark = false,
    this.logoText = 'ConGest',
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDark ? AppColors.cardDark : AppColors.primary;

    return Container(
      width: 254,
      height: 136,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9.61),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 0.99,
            offset: Offset(-0.5, -0.5),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x3DFFFFFF),
            blurRadius: 1.37,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background logo watermark
          Positioned(
            right: -50,
            top: -60,
            child: Opacity(
              opacity: 0.07,
              child: Transform.rotate(
                angle: -0.99, // -56.76 degrees in radians
                child: Container(
                  width: 202,
                  height: 202,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row with logo and chip
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 18,
                        height: 18.64,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.credit_card,
                            size: 12,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4.61),
                      Text(
                        logoText ?? 'ConGest',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  // Chip icon placeholder
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.wifi,
                        size: 20,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Card number
              Text(
                cardNumber,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 1.14,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10),
              // Bottom row with name and expiry
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NAME',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 4,
                            fontWeight: FontWeight.w600,
                            height: 1.25,
                            letterSpacing: -0.025,
                            color: AppColors.white.withValues(alpha: 0.8),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          holderName.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            letterSpacing: -0.025,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'EXPIRY DATE',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 4,
                            fontWeight: FontWeight.w600,
                            height: 1.25,
                            letterSpacing: -0.025,
                            color: AppColors.white.withValues(alpha: 0.8),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          expiryDate,
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            letterSpacing: -0.025,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
