import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/selection_card.dart';
import 'address_screen.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int? _selectedGender;

  final List<Map<String, dynamic>> _genderOptions = [
    {'label': 'Mulher', 'icon': Icons.female},
    {'label': 'Homem', 'icon': Icons.male},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Qual é o seu género?'),
            // Progress bar
            _buildProgressBar(0.42),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  children: [
                    // Gender options
                    ...List.generate(_genderOptions.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index < _genderOptions.length - 1 ? 14 : 0,
                        ),
                        child: SelectionCard(
                          title: _genderOptions[index]['label'],
                          isSelected: _selectedGender == index,
                          showCheckIcon: false,
                          onTap: () {
                            setState(() {
                              _selectedGender = index;
                            });
                          },
                        ),
                      );
                    }),
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
        builder: (_) => const AddressScreen(),
      ),
    );
  }
}
