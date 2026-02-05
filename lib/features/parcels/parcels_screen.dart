import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/status_badge.dart';
import '../../shared/widgets/thin_icons.dart';

class ParcelsScreen extends StatefulWidget {
  const ParcelsScreen({super.key});

  @override
  State<ParcelsScreen> createState() => _ParcelsScreenState();
}

class _ParcelsScreenState extends State<ParcelsScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: 'Encomendas',
              subtitle: 'Encomendas recebidas na portaria',
              onBack: () => Navigator.of(context).pop(),
            ),

            // Stats row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _StatCard(
                    value: '2',
                    label: 'Para Levantar',
                    color: AppColors.accentAmber,
                  ),
                  const SizedBox(width: 12),
                  _StatCard(
                    value: '8',
                    label: 'Levantadas',
                    color: AppColors.success,
                  ),
                  const SizedBox(width: 12),
                  _StatCard(
                    value: '10',
                    label: 'Total',
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Tab selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 44,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.buttonBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    _TabButton(
                      label: 'Pendentes',
                      isActive: _selectedTab == 0,
                      onTap: () => setState(() => _selectedTab = 0),
                    ),
                    _TabButton(
                      label: 'Levantadas',
                      isActive: _selectedTab == 1,
                      onTap: () => setState(() => _selectedTab = 1),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: _selectedTab == 0
                    ? [
                        const _ParcelCard(
                          sender: 'Amazon',
                          trackingCode: 'AMZ-2026-88431',
                          receivedDate: '05 Fev 2026 • 09:30',
                          type: 'Caixa Média',
                          status: 'Na Portaria',
                          statusType: BadgeType.warning,
                        ),
                        const SizedBox(height: 8),
                        const _ParcelCard(
                          sender: 'Jumia',
                          trackingCode: 'JUM-2026-12045',
                          receivedDate: '04 Fev 2026 • 14:15',
                          type: 'Envelope',
                          status: 'Na Portaria',
                          statusType: BadgeType.warning,
                        ),
                        const SizedBox(height: 24),
                      ]
                    : [
                        const _ParcelCard(
                          sender: 'Correios',
                          trackingCode: 'CTT-2026-55218',
                          receivedDate: '03 Fev 2026 • 11:00',
                          type: 'Caixa Pequena',
                          status: 'Levantada',
                          statusType: BadgeType.success,
                          pickedUpBy: 'Carlos Mendes',
                          pickedUpDate: '03 Fev 2026 • 18:45',
                        ),
                        const SizedBox(height: 8),
                        const _ParcelCard(
                          sender: 'Magazine Luiza',
                          trackingCode: 'MGL-2026-77319',
                          receivedDate: '01 Fev 2026 • 16:20',
                          type: 'Caixa Grande',
                          status: 'Levantada',
                          statusType: BadgeType.success,
                          pickedUpBy: 'Carlos Mendes',
                          pickedUpDate: '02 Fev 2026 • 08:30',
                        ),
                        const SizedBox(height: 8),
                        const _ParcelCard(
                          sender: 'DHL Express',
                          trackingCode: 'DHL-2026-44109',
                          receivedDate: '30 Jan 2026 • 10:45',
                          type: 'Envelope',
                          status: 'Levantada',
                          statusType: BadgeType.success,
                          pickedUpBy: 'Carlos Mendes',
                          pickedUpDate: '30 Jan 2026 • 19:00',
                        ),
                        const SizedBox(height: 24),
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: AppTextStyles.label(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isActive ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? AppColors.textPrimary
                    : AppColors.textTertiary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ParcelCard extends StatelessWidget {
  final String sender;
  final String trackingCode;
  final String receivedDate;
  final String type;
  final String status;
  final BadgeType statusType;
  final String? pickedUpBy;
  final String? pickedUpDate;

  const _ParcelCard({
    required this.sender,
    required this.trackingCode,
    required this.receivedDate,
    required this.type,
    required this.status,
    required this.statusType,
    this.pickedUpBy,
    this.pickedUpDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.accentAmber.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: ThinIcon(
                    painter: ParcelIconPainter(color: AppColors.accentAmber),
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(sender, style: AppTextStyles.buttonSecondary()),
                    const SizedBox(height: 2),
                    Text(trackingCode, style: AppTextStyles.label()),
                  ],
                ),
              ),
              StatusBadge(label: status, type: statusType),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ThinIcon(
                painter: ClockIconPainter(color: AppColors.textTertiary),
                size: 14,
              ),
              const SizedBox(width: 4),
              Text('Recebida: $receivedDate', style: AppTextStyles.label()),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ThinIcon(
                painter: ParcelIconPainter(color: AppColors.textTertiary),
                size: 14,
              ),
              const SizedBox(width: 4),
              Text('Tipo: $type', style: AppTextStyles.label()),
            ],
          ),
          if (pickedUpBy != null) ...[
            const SizedBox(height: 8),
            Container(
              height: 1,
              color: AppColors.divider,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ThinIcon(
                  painter: ProfileIconPainter(color: AppColors.textTertiary),
                  size: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  'Levantada por: $pickedUpBy',
                  style: AppTextStyles.label(),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                ThinIcon(
                  painter: ClockIconPainter(color: AppColors.textTertiary),
                  size: 14,
                ),
                const SizedBox(width: 4),
                Text('Em: $pickedUpDate', style: AppTextStyles.label()),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
