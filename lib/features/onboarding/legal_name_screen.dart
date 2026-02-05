import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/primary_button.dart';
import 'birthday_screen.dart';

class LegalNameScreen extends StatefulWidget {
  const LegalNameScreen({super.key});

  @override
  State<LegalNameScreen> createState() => _LegalNameScreenState();
}

class _LegalNameScreenState extends State<LegalNameScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'O seu nome legal'),
            // Progress bar
            _buildProgressBar(0.21),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Nome Completo',
                      hintText: 'Introduza o seu nome completo',
                      controller: _firstNameController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      label: 'Apelido',
                      hintText: 'Introduza o seu apelido',
                      controller: _lastNameController,
                    ),
                    const Spacer(),
                    PrimaryButton(
                      label: 'Continuar',
                      onPressed: _handleContinue,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            // Home indicator
            _buildHomeIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(double progress) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: AppColors.white,
      child: Container(
        height: 8,
        decoration: BoxDecoration(
          color: AppColors.progressBackground,
          borderRadius: BorderRadius.circular(99),
        ),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: progress,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(99),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeIndicator() {
    return Container(
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
    );
  }

  void _handleContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const BirthdayScreen(),
      ),
    );
  }
}
