import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/password_indicator.dart';
import '../../shared/widgets/success_popup.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _password = '';

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
            const CustomAppBar(title: 'Nova Palavra-passe'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  children: [
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
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 16),
                    // Confirm password field
                    CustomTextField(
                      label: 'Confirmar Palavra-passe',
                      hintText: 'Confirme a sua palavra-passe',
                      obscureText: true,
                      showPasswordToggle: true,
                      controller: _confirmPasswordController,
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      label: 'Continuar',
                      onPressed: _handleContinue,
                    ),
                    const Spacer(),
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

  void _handleContinue() {
    SuccessPopup.show(
      context,
      title: 'Sucesso!',
      subtitle: 'Por favor, faça login novamente para começar',
      buttonText: 'Voltar ao Login',
      onButtonPressed: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    );
  }
}
