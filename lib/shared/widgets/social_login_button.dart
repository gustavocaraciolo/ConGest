import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';

enum SocialProvider { google, apple, facebook }

class SocialLoginButton extends StatelessWidget {
  final SocialProvider provider;
  final VoidCallback? onPressed;

  const SocialLoginButton({
    super.key,
    required this.provider,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(),
            const SizedBox(width: 12),
            Text(
              _getLabel(),
              style: AppTextStyles.buttonSecondary(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    switch (provider) {
      case SocialProvider.google:
        return _GoogleIcon();
      case SocialProvider.apple:
        return const Icon(Icons.apple, size: 24, color: AppColors.black);
      case SocialProvider.facebook:
        return _FacebookIcon();
    }
  }

  String _getLabel() {
    switch (provider) {
      case SocialProvider.google:
        return 'Continue with Google';
      case SocialProvider.apple:
        return 'Sign Up with Apple';
      case SocialProvider.facebook:
        return 'Continue with Facebook';
    }
  }
}

class _GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CustomPaint(
        painter: _GoogleIconPainter(),
      ),
    );
  }
}

class _GoogleIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2;

    // Google G icon colors
    final redPaint = Paint()..color = const Color(0xFFEA4335);
    final yellowPaint = Paint()..color = const Color(0xFFFBBC05);
    final greenPaint = Paint()..color = const Color(0xFF34A853);
    final bluePaint = Paint()..color = const Color(0xFF4285F4);

    // Draw simplified G
    final path = Path();
    path.addArc(
      Rect.fromCircle(center: center, radius: radius),
      -0.5,
      3.14,
    );
    canvas.drawPath(path, redPaint);

    final path2 = Path();
    path2.addArc(
      Rect.fromCircle(center: center, radius: radius),
      2.64,
      1.0,
    );
    canvas.drawPath(path2, yellowPaint);

    final path3 = Path();
    path3.addArc(
      Rect.fromCircle(center: center, radius: radius),
      3.64,
      1.0,
    );
    canvas.drawPath(path3, greenPaint);

    final path4 = Path();
    path4.addArc(
      Rect.fromCircle(center: center, radius: radius),
      4.64,
      1.0,
    );
    canvas.drawPath(path4, bluePaint);

    // Inner white circle
    canvas.drawCircle(
      center,
      radius * 0.6,
      Paint()..color = Colors.white,
    );

    // Blue bar
    canvas.drawRect(
      Rect.fromLTWH(center.dx, center.dy - 2, radius, 4),
      bluePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FacebookIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        color: Color(0xFF1877F2),
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Text(
          'f',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
