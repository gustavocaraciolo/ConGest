import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../shared/widgets/custom_app_bar.dart';

class LoginActivityScreen extends StatefulWidget {
  const LoginActivityScreen({super.key});

  @override
  State<LoginActivityScreen> createState() => _LoginActivityScreenState();
}

class _LoginActivityScreenState extends State<LoginActivityScreen> {
  final List<_DeviceSession> _devices = [
    _DeviceSession(
      name: 'iPhone 14 Pro',
      type: DeviceType.mobile,
      ip: '192.168.1.100',
      location: 'Luanda, Angola',
      isCurrentDevice: true,
      lastActive: 'Activo agora',
    ),
    _DeviceSession(
      name: 'MacBook Pro',
      type: DeviceType.desktop,
      ip: '192.168.1.101',
      location: 'Luanda, Angola',
      isCurrentDevice: false,
      lastActive: 'Há 2 horas',
    ),
    _DeviceSession(
      name: 'Samsung Galaxy S23',
      type: DeviceType.mobile,
      ip: '10.0.0.55',
      location: 'Benguela, Angola',
      isCurrentDevice: false,
      lastActive: 'Há 1 dia',
    ),
    _DeviceSession(
      name: 'Windows PC',
      type: DeviceType.desktop,
      ip: '192.168.0.50',
      location: 'Lubango, Angola',
      isCurrentDevice: false,
      lastActive: 'Há 3 dias',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Actividade de Login'),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(24),
                itemCount: _devices.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final device = _devices[index];
                  return _buildDeviceCard(device);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceCard(_DeviceSession device) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 27,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: device.isCurrentDevice
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : AppColors.inputBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              device.type == DeviceType.mobile
                  ? Icons.phone_android
                  : Icons.computer,
              color: device.isCurrentDevice
                  ? AppColors.primary
                  : AppColors.textSecondary,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      device.name,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                        height: 1.43,
                      ),
                    ),
                    if (device.isCurrentDevice) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Este dispositivo',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.success,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${device.ip} | ${device.location}',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  device.lastActive,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textTertiary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          if (!device.isCurrentDevice)
            GestureDetector(
              onTap: () => _removeDevice(device),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.danger.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: AppColors.danger,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _removeDevice(_DeviceSession device) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Remover Dispositivo',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          'Tens a certeza que queres terminar a sessão em "${device.name}"?',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancelar',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _devices.remove(device);
              });
              Navigator.pop(context);
            },
            child: Text(
              'Remover',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.danger,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DeviceType { mobile, desktop }

class _DeviceSession {
  final String name;
  final DeviceType type;
  final String ip;
  final String location;
  final bool isCurrentDevice;
  final String lastActive;

  _DeviceSession({
    required this.name,
    required this.type,
    required this.ip,
    required this.location,
    required this.isCurrentDevice,
    required this.lastActive,
  });
}
