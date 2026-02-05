import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';
import '../../shared/widgets/toggle_switch.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  int _selectedTab = 0;

  final Map<String, bool> _emailSettings = {
    'transactions': true,
    'paymentReminders': true,
    'balanceAlerts': false,
    'offers': true,
    'customerSupport': true,
  };

  final Map<String, bool> _pushSettings = {
    'transactions': true,
    'paymentReminders': true,
    'balanceAlerts': true,
    'offers': false,
    'customerSupport': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Notificações'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    _buildTab('Email', 0),
                    _buildTab('Push', 1),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _buildSettingItem(
                      'Notificações de Transacções',
                      'Receba alertas sobre todas as transacções',
                      'transactions',
                    ),
                    _buildSettingItem(
                      'Lembretes de Pagamento',
                      'Alertas sobre pagamentos pendentes',
                      'paymentReminders',
                    ),
                    _buildSettingItem(
                      'Alertas de Saldo',
                      'Notificações quando o saldo estiver baixo',
                      'balanceAlerts',
                    ),
                    _buildSettingItem(
                      'Ofertas e Promoções',
                      'Receba ofertas exclusivas',
                      'offers',
                    ),
                    _buildSettingItem(
                      'Suporte ao Cliente',
                      'Actualizações sobre os seus pedidos de suporte',
                      'customerSupport',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, String subtitle, String key) {
    final settings = _selectedTab == 0 ? _emailSettings : _pushSettings;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.settingsDivider),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                    height: 1.43,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          ToggleSwitch(
            value: settings[key]!,
            onChanged: (value) {
              setState(() {
                if (_selectedTab == 0) {
                  _emailSettings[key] = value;
                } else {
                  _pushSettings[key] = value;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
