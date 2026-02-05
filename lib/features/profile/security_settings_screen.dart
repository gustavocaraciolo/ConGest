import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/toggle_switch.dart';
import 'widgets/settings_card.dart';
import 'widgets/settings_item.dart';
import 'login_activity_screen.dart';

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({super.key});

  @override
  State<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  bool _twoFactorEnabled = true;
  bool _faceIdEnabled = false;
  bool _transactionAlerts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Definições de Segurança'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    SettingsCard(
                      title: 'Autenticação',
                      items: [
                        SettingsItem(
                          icon: Icons.security,
                          label: 'Autenticação de Dois Factores',
                          trailing: ToggleSwitch(
                            value: _twoFactorEnabled,
                            onChanged: (value) {
                              setState(() => _twoFactorEnabled = value);
                            },
                          ),
                        ),
                        SettingsItem(
                          icon: Icons.pin,
                          label: 'Alterar PIN de Transacção',
                          onTap: () {},
                        ),
                        SettingsItem(
                          icon: Icons.lock_outline,
                          label: 'Alterar Palavra-passe',
                          onTap: () {},
                        ),
                        SettingsItem(
                          icon: Icons.face,
                          label: 'Face ID',
                          trailing: ToggleSwitch(
                            value: _faceIdEnabled,
                            onChanged: (value) {
                              setState(() => _faceIdEnabled = value);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SettingsCard(
                      title: 'Monitorização',
                      items: [
                        SettingsItem(
                          icon: Icons.devices,
                          label: 'Actividade de Login',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginActivityScreen(),
                              ),
                            );
                          },
                        ),
                        SettingsItem(
                          icon: Icons.notifications_active_outlined,
                          label: 'Alertas de Transacção',
                          trailing: ToggleSwitch(
                            value: _transactionAlerts,
                            onChanged: (value) {
                              setState(() => _transactionAlerts = value);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
