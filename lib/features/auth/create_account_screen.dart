import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/password_indicator.dart';
import 'enter_otp_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _fullNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _password = '';

  @override
  void dispose() {
    _fullNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
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
                    // Form fields
                    CustomTextField(
                      label: 'Nome Completo',
                      hintText: 'Introduza o seu nome completo',
                      controller: _fullNameController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Apelido',
                      hintText: 'Introduza o seu apelido',
                      controller: _lastNameController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Email',
                      hintText: 'Introduza o seu email',
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 16),
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
                          isValid: PasswordValidation.hasMinLength(_password),
                        ),
                        const SizedBox(height: 8),
                        PasswordIndicator(
                          text: 'Pelo menos 1 número (1-9)',
                          isValid: PasswordValidation.hasNumber(_password),
                        ),
                        const SizedBox(height: 8),
                        PasswordIndicator(
                          text: 'Pelo menos letras minúsculas ou maiúsculas',
                          isValid: PasswordValidation.hasUpperOrLower(_password),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Create account button
                    PrimaryButton(
                      label: 'Criar Conta',
                      onPressed: _handleCreateAccount,
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
                            color: AppColors.textTertiary,
                            height: 1.5,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const EnterOtpScreen(),
      ),
    );
  }
}
