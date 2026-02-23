import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/otp_input.dart';
import '../../shared/widgets/password_indicator.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/success_popup.dart';

class VerifyAndSetPasswordScreen extends StatefulWidget {
  const VerifyAndSetPasswordScreen({super.key});

  @override
  State<VerifyAndSetPasswordScreen> createState() =>
      _VerifyAndSetPasswordScreenState();
}

class _VerifyAndSetPasswordScreenState
    extends State<VerifyAndSetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _password = '';
  // ignore: unused_field
  String _otp = '';

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Criar uma Conta'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                child: Column(
                  children: [
                    // Description text
                    Text(
                      'Introduza o código de 6 dígitos que enviámos para o seu email',
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
                      length: 6,
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
                    // Resend link
                    Text(
                      'Não recebeu o código? Reenviar',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    // Password field
                    CustomTextField(
                      label: 'Palavra-passe',
                      hintText: 'Introduza a sua palavra-passe',
                      obscureText: true,
                      showPasswordToggle: true,
                      controller: _passwordController,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    // Confirm password field
                    CustomTextField(
                      label: 'Confirmar Palavra-passe',
                      hintText: 'Confirme a sua palavra-passe',
                      obscureText: true,
                      showPasswordToggle: true,
                      controller: _confirmPasswordController,
                    ),
                    const SizedBox(height: 16),
                    // Password indicators
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PasswordIndicator(
                          text: 'Mínimo 8 caracteres',
                          isValid:
                              PasswordValidation.hasMinLength(_password),
                        ),
                        const SizedBox(height: 8),
                        PasswordIndicator(
                          text: 'Pelo menos 1 número (1-9)',
                          isValid:
                              PasswordValidation.hasNumber(_password),
                        ),
                        const SizedBox(height: 8),
                        PasswordIndicator(
                          text: 'Pelo menos letras minúsculas ou maiúsculas',
                          isValid:
                              PasswordValidation.hasUpperOrLower(_password),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Create account button
                    PrimaryButton(
                      label: 'Criar Conta',
                      onPressed: _handleCreateAccount,
                    ),
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

  void _handleCreateAccount() {
    SuccessPopup.show(
      context,
      title: 'Conta Criada!',
      subtitle: 'A sua conta foi criada com sucesso',
      buttonText: 'Voltar ao Login',
      onButtonPressed: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    );
  }
}
