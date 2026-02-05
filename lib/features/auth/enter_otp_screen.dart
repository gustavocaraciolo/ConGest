import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/otp_input.dart';
import '../../shared/widgets/primary_button.dart';
import '../onboarding/verify_identity_screen.dart';

class EnterOtpScreen extends StatefulWidget {
  final String? phoneNumber;

  const EnterOtpScreen({
    super.key,
    this.phoneNumber,
  });

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  String _otp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Introduzir Código'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  children: [
                    // Description
                    Text(
                      'Introduza o código de 4 dígitos que enviámos para (+244) 9XX XXX XXX',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                        letterSpacing: -0.5,
                        height: 1.43,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    // OTP Input
                    OtpInput(
                      length: 4,
                      onCompleted: (otp) {
                        setState(() {
                          _otp = otp;
                        });
                      },
                      onChanged: (otp) {
                        setState(() {
                          _otp = otp;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    // Resend text
                    Text(
                      "Não recebeu o código? Reenviar",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    // Verify button
                    PrimaryButton(
                      label: 'Continuar',
                      onPressed: _otp.length == 4 ? _handleVerify : null,
                    ),
                    const SizedBox(height: 20),
                    // Sign in link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Já tem uma conta? ',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.popUntil(context, (route) => route.isFirst);
                          },
                          child: Text(
                            'Entrar',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            // Home indicator
            Container(
              height: 36,
              child: Center(
                child: Container(
                  width: 134,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.textPrimary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleVerify() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const VerifyIdentityScreen(),
      ),
    );
  }
}
