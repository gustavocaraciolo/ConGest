import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/selection_card.dart';
import 'upload_documents_screen.dart';

class ProofOfIdentityScreen extends StatefulWidget {
  const ProofOfIdentityScreen({super.key});

  @override
  State<ProofOfIdentityScreen> createState() => _ProofOfIdentityScreenState();
}

class _ProofOfIdentityScreenState extends State<ProofOfIdentityScreen> {
  int? _selectedDocument;

  final List<String> _documentTypes = [
    'Passaporte',
    'Bilhete de Identidade (BI)',
    'Outro',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Comprovativo de Identidade'),
            // Progress bar
            _buildProgressBar(0.65),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  children: [
                    // Document type options
                    ...List.generate(_documentTypes.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index < _documentTypes.length - 1 ? 14 : 0,
                        ),
                        child: SelectionCard(
                          title: _documentTypes[index],
                          isSelected: _selectedDocument == index,
                          showCheckIcon: false,
                          onTap: () {
                            setState(() {
                              _selectedDocument = index;
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
        builder: (_) => const UploadDocumentsScreen(),
      ),
    );
  }
}
