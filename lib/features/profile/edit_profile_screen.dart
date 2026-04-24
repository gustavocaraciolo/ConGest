import 'package:congest/shared/util/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/primary_button.dart';
import 'package:congest/services/profile_service.dart';

class EditProfileScreen extends StatefulWidget {
  final String? imageUrl;

  const EditProfileScreen({super.key, this.imageUrl});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Profile? profileUser;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _nationalityController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _birthDateController.dispose();
    _nationalityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _profile();
  }

  Future<void> _profile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final result = await ProfileService.getProfile();

      if (mounted && result != null) {
        setState(() {
          profileUser = result;
          _nameController.text = result.name;
          _phoneController.text = result.phoneNumber;
          _birthDateController.text = DateFormatUtils.datetoDMY(
            result.birthday,
          );
          _nationalityController.text = result.nationality;
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Editar Perfil'),
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.white,
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.1,
                                        ),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: ClipOval(
                                    child: widget.imageUrl != null
                                        ? Image.network(
                                            widget.imageUrl!,
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    _buildPlaceholder(),
                                          )
                                        : _buildPlaceholder(),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 16,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          CustomTextField(
                            label: 'Nome',
                            hintText: 'Introduza o seu nome',
                            controller: _nameController,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            label: 'Telemóvel',
                            hintText: 'Introduza o seu telemóvel',
                            keyboardType: TextInputType.phone,
                            controller: _phoneController,
                          ),
                          const SizedBox(height: 16),
                          _buildDateField(),
                          const SizedBox(height: 16),
                          CustomTextField(
                            label: 'Nacionalidade',
                            hintText: 'Seleccione a nacionalidade',
                            controller: _nationalityController,
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
            ),
            if (!_isLoading)
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    PrimaryButton(
                      label: 'Guardar Alterações',
                      onPressed: _handleSave,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Cancelar',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data de Nascimento',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: _selectDate,
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _birthDateController.text.isEmpty
                        ? 'Seleccione a data'
                        : _birthDateController.text,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: _birthDateController.text.isEmpty
                          ? AppColors.textSecondary
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    DateTime initialDate = DateTime(1990, 3, 15);
    if (_birthDateController.text.isNotEmpty) {
      try {
        final parts = _birthDateController.text.split('-');
        if (parts.length == 3) {
          initialDate = DateTime(
            int.parse(parts[0]),
            int.parse(parts[1]),
            int.parse(parts[2]),
          );
        }
      } catch (_) {}
    }

    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: AppColors.primary),
          ),
          child: child!,
        );
      },
    );
    if (date != null) {
      setState(() {
        _birthDateController.text =
            '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
      });
    }
  }

  void _handleSave() {
    Navigator.pop(context);
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppColors.placeholderColor,
      width: 100,
      height: 100,
      child: const Icon(Icons.person, size: 50, color: AppColors.white),
    );
  }
}
