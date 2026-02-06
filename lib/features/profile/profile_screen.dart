import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/toggle_switch.dart';
import '../auth/login_screen.dart';
import 'edit_profile_screen.dart';
import 'notification_settings_screen.dart';
import 'security_settings_screen.dart';
import 'theme_settings_screen.dart';
import 'login_activity_screen.dart';
import 'language_screen.dart';
import 'widgets/profile_header.dart';
import 'widgets/settings_card.dart';
import 'widgets/settings_item.dart';
import 'widgets/logout_popup.dart';
import 'widgets/profile_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _biometricEnabled = true;
  bool _soundsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              bottom: false,
              child: ProfileHeader(
                imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop&crop=face',
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SettingsCard(
                    title: 'Definições de Conta',
                    items: [
                      SettingsItem(
                        leadingWidget: const UserIcon(),
                        label: 'Informações da Conta',
                        onTap: () => _navigateTo(const EditProfileScreen(
                          imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop&crop=face',
                        )),
                      ),
                      SettingsItem(
                        leadingWidget: const NotificationIcon(),
                        label: 'Preferências de Notificação',
                        onTap: () =>
                            _navigateTo(const NotificationSettingsScreen()),
                      ),
                      SettingsItem(
                        leadingWidget: const GlobeIcon(),
                        label: 'Idioma',
                        onTap: () => _navigateTo(const LanguageScreen()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SettingsCard(
                    title: 'Definições de Segurança',
                    items: [
                      SettingsItem(
                        leadingWidget: const LockIcon(),
                        label: 'Palavra-passe & Segurança',
                        onTap: () =>
                            _navigateTo(const SecuritySettingsScreen()),
                      ),
                      SettingsItem(
                        leadingWidget: const FingerprintIcon(),
                        label: 'Autenticação Biométrica',
                        trailing: ToggleSwitch(
                          value: _biometricEnabled,
                          onChanged: (value) {
                            setState(() => _biometricEnabled = value);
                          },
                        ),
                      ),
                      SettingsItem(
                        leadingWidget: const DevicesIcon(),
                        label: 'Actividade de Login',
                        onTap: () => _navigateTo(const LoginActivityScreen()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SettingsCard(
                    title: 'Preferências da App',
                    items: [
                      SettingsItem(
                        leadingWidget: const PaletteIcon(),
                        label: 'Tema',
                        onTap: () => _navigateTo(const ThemeSettingsScreen()),
                      ),
                      SettingsItem(
                        leadingWidget: const VolumeIcon(),
                        label: 'Sons',
                        trailing: ToggleSwitch(
                          value: _soundsEnabled,
                          onChanged: (value) {
                            setState(() => _soundsEnabled = value);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SettingsCard(
                    title: 'Suporte & Legal',
                    items: [
                      SettingsItem(
                        leadingWidget: const FaqIcon(),
                        label: 'Perguntas Frequentes',
                        onTap: () {},
                      ),
                      SettingsItem(
                        leadingWidget: const HelpCenterIcon(),
                        label: 'Centro de Ajuda',
                        onTap: () {},
                      ),
                      SettingsItem(
                        leadingWidget: const ReportProblemIcon(),
                        label: 'Reportar Problema',
                        onTap: () {},
                      ),
                      SettingsItem(
                        leadingWidget: const PrivacyPolicyIcon(),
                        label: 'Política de Privacidade',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SettingsCard(
                    title: 'Controlo de Conta',
                    items: [
                      SettingsItem(
                        leadingWidget: const LogoutIcon(color: AppColors.danger),
                        label: 'Terminar Sessão',
                        iconColor: AppColors.danger,
                        textColor: AppColors.danger,
                        trailing: const SizedBox.shrink(),
                        onTap: _handleLogout,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  Future<void> _handleLogout() async {
    final shouldLogout = await LogoutPopup.show(context);
    if (shouldLogout == true && mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }
}
