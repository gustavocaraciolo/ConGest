import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/congest_logo.dart';
import '../../shared/widgets/social_login_button.dart';
import '../../shared/widgets/primary_button.dart';
import '../home/main_shell.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 48),
              // Logo
              const CongestLogo(
                color: AppColors.primary,
                iconSize: 56,
                fontSize: 28,
              ),
              const SizedBox(height: 48),
              // Welcome text
              Text(
                'Welcome to ConGest',
                style: AppTextStyles.heading(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Gerencie seu condomínio de forma simples e eficiente. Acesse reservas, comunicados e muito mais.',
                style: AppTextStyles.body(),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Social login buttons
              SocialLoginButton(
                provider: SocialProvider.google,
                onPressed: () => _handleSocialLogin(context, 'Google'),
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                provider: SocialProvider.apple,
                onPressed: () => _handleSocialLogin(context, 'Apple'),
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                provider: SocialProvider.facebook,
                onPressed: () => _handleSocialLogin(context, 'Facebook'),
              ),
              const SizedBox(height: 24),
              // Divider with "or"
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppColors.divider,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'or',
                      style: AppTextStyles.caption(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppColors.divider,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Sign Up button
              PrimaryButton(
                label: 'Sign Up',
                onPressed: () => _handleSignUp(context),
              ),
              const SizedBox(height: 24),
              // Terms text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text.rich(
                  TextSpan(
                    text: 'Ao continuar, você concorda com nossos ',
                    style: AppTextStyles.caption(color: AppColors.textTertiary),
                    children: [
                      TextSpan(
                        text: 'Termos de Serviço',
                        style: AppTextStyles.caption(color: AppColors.primary),
                      ),
                      const TextSpan(text: ' e '),
                      TextSpan(
                        text: 'Política de Privacidade',
                        style: AppTextStyles.caption(color: AppColors.primary),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSocialLogin(BuildContext context, String provider) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainShell()),
    );
  }

  void _handleSignUp(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainShell()),
    );
  }
}
