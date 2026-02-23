import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/primary_button.dart';
import 'verify_and_set_password_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _documentController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();

  String _selectedCountry = 'Angola';

  final List<String> _countries = ['Angola', 'Brasil', 'Portugal'];

  @override
  void dispose() {
    _documentController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _confirmEmailController.dispose();
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
                    // Country dropdown
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'País do Documento',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 6),
                        DropdownButtonFormField<String>(
                          initialValue: _selectedCountry,
                          items: _countries.map((country) {
                            return DropdownMenuItem(
                              value: country,
                              child: Text(
                                country,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCountry = value!;
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.buttonBackground,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: AppColors.primary,
                                width: 1,
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.textPrimary,
                          ),
                          dropdownColor: AppColors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Document field
                    CustomTextField(
                      label: 'Documento',
                      hintText: 'Introduza o número do documento',
                      controller: _documentController,
                    ),
                    const SizedBox(height: 16),
                    // Name field
                    CustomTextField(
                      label: 'Nome',
                      hintText: 'Introduza o seu nome',
                      controller: _nameController,
                    ),
                    const SizedBox(height: 16),
                    // Email field
                    CustomTextField(
                      label: 'Email',
                      hintText: 'Introduza o seu email',
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 16),
                    // Confirm email field
                    CustomTextField(
                      label: 'Confirmação de Email',
                      hintText: 'Confirme o seu email',
                      keyboardType: TextInputType.emailAddress,
                      controller: _confirmEmailController,
                    ),
                    const SizedBox(height: 24),
                    // Continue button
                    PrimaryButton(
                      label: 'Continuar',
                      onPressed: _handleContinue,
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

  void _handleContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const VerifyAndSetPasswordScreen(),
      ),
    );
  }
}
