import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'pt_AO';
  String _searchQuery = '';

  final List<_Language> _languages = [
    _Language(code: 'pt_AO', name: 'Português (Angola)', flag: '🇦🇴'),
    _Language(code: 'pt_PT', name: 'Português (Portugal)', flag: '🇵🇹'),
    _Language(code: 'pt_BR', name: 'Português (Brasil)', flag: '🇧🇷'),
    _Language(code: 'en_US', name: 'English (US)', flag: '🇺🇸'),
    _Language(code: 'en_GB', name: 'English (UK)', flag: '🇬🇧'),
    _Language(code: 'es_ES', name: 'Español', flag: '🇪🇸'),
    _Language(code: 'fr_FR', name: 'Français', flag: '🇫🇷'),
    _Language(code: 'de_DE', name: 'Deutsch', flag: '🇩🇪'),
    _Language(code: 'it_IT', name: 'Italiano', flag: '🇮🇹'),
    _Language(code: 'zh_CN', name: '中文 (简体)', flag: '🇨🇳'),
    _Language(code: 'ja_JP', name: '日本語', flag: '🇯🇵'),
    _Language(code: 'ko_KR', name: '한국어', flag: '🇰🇷'),
    _Language(code: 'ar_SA', name: 'العربية', flag: '🇸🇦'),
    _Language(code: 'hi_IN', name: 'हिन्दी', flag: '🇮🇳'),
    _Language(code: 'ru_RU', name: 'Русский', flag: '🇷🇺'),
  ];

  List<_Language> get _filteredLanguages {
    if (_searchQuery.isEmpty) return _languages;
    return _languages
        .where((lang) =>
            lang.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Idioma'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: (value) =>
                          setState(() => _searchQuery = value),
                      decoration: InputDecoration(
                        hintText: 'Pesquisar idioma',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textHint,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.textSecondary,
                          size: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${_filteredLanguages.length} Idiomas',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _filteredLanguages.length,
                itemBuilder: (context, index) {
                  final language = _filteredLanguages[index];
                  return _buildLanguageItem(language);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageItem(_Language language) {
    final isSelected = _selectedLanguage == language.code;
    return GestureDetector(
      onTap: () => setState(() => _selectedLanguage = language.code),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.settingsDivider),
          ),
        ),
        child: Row(
          children: [
            Text(
              language.flag,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                language.name,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                  height: 1.43,
                ),
              ),
            ),
            if (isSelected)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 14,
                  color: AppColors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Language {
  final String code;
  final String name;
  final String flag;

  _Language({
    required this.code,
    required this.name,
    required this.flag,
  });
}
