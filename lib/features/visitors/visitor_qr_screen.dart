import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_list_tile.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/selection_chip.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/thin_icons.dart';

class VisitorQrScreen extends StatefulWidget {
  const VisitorQrScreen({super.key});

  @override
  State<VisitorQrScreen> createState() => _VisitorQrScreenState();
}

class _VisitorQrScreenState extends State<VisitorQrScreen> {
  final _nameController = TextEditingController();
  final _documentController = TextEditingController();
  String? _generatedCode;
  DateTime? _expiryDate;

  @override
  void dispose() {
    _nameController.dispose();
    _documentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: 'QR Visitante',
              subtitle: 'Gere um código para o seu visitante',
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _generatedCode == null
                    ? _buildForm()
                    : _buildQrResult(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nome do Visitante', style: AppTextStyles.label()),
        const SizedBox(height: 8),
        AppTextField(
          controller: _nameController,
          hintText: 'Digite o nome completo',
          prefixIcon: ProfileIconPainter(color: AppColors.textTertiary),
          backgroundColor: AppColors.white,
        ),
        const SizedBox(height: 16),
        Text('Documento (BI/Passaporte)', style: AppTextStyles.label()),
        const SizedBox(height: 8),
        AppTextField(
          controller: _documentController,
          hintText: 'Número do documento',
          prefixIcon: InvoiceIconPainter(color: AppColors.textTertiary),
          backgroundColor: AppColors.white,
        ),
        const SizedBox(height: 16),
        Text('Validade', style: AppTextStyles.label()),
        const SizedBox(height: 8),
        Row(
          children: [
            SelectionChip(
              label: '4 horas',
              isSelected: _expiryDate != null &&
                  _expiryDate!
                      .difference(DateTime.now())
                      .inHours <=
                      4,
              onTap: () => setState(() =>
                  _expiryDate =
                      DateTime.now().add(const Duration(hours: 4))),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            const SizedBox(width: 8),
            SelectionChip(
              label: '1 dia',
              isSelected: _expiryDate != null &&
                  _expiryDate!
                      .difference(DateTime.now())
                      .inHours >
                      4 &&
                  _expiryDate!
                      .difference(DateTime.now())
                      .inDays <=
                      1,
              onTap: () => setState(() =>
                  _expiryDate =
                      DateTime.now().add(const Duration(days: 1))),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            const SizedBox(width: 8),
            SelectionChip(
              label: '3 dias',
              isSelected: _expiryDate != null &&
                  _expiryDate!
                      .difference(DateTime.now())
                      .inDays >
                      1,
              onTap: () => setState(() =>
                  _expiryDate =
                      DateTime.now().add(const Duration(days: 3))),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ],
        ),
        const SizedBox(height: 32),
        PrimaryButton(
          label: 'Gerar QR Code',
          onPressed: _nameController.text.isNotEmpty
              ? () {
                  setState(() {
                    final code = Random().nextInt(999999).toString().padLeft(6, '0');
                    _generatedCode =
                        'CONGEST-VISIT|${_nameController.text}|${_documentController.text}|$code|${_expiryDate?.toIso8601String() ?? DateTime.now().add(const Duration(hours: 4)).toIso8601String()}';
                  });
                }
              : null,
        ),
        const SizedBox(height: 24),

        // Recent visitors
        Text('Visitantes Recentes', style: AppTextStyles.title()),
        const SizedBox(height: 12),
        const _RecentVisitorItem(
          name: 'Maria Silva',
          date: '03 Fev 2026 • 14:30',
          status: 'Activo',
        ),
        const SizedBox(height: 8),
        const _RecentVisitorItem(
          name: 'João Santos',
          date: '01 Fev 2026 • 10:00',
          status: 'Expirado',
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildQrResult() {
    return Column(
      children: [
        const SizedBox(height: 8),
        AppCard(
          borderRadius: 20,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                'QR Code do Visitante',
                style: AppTextStyles.title(),
              ),
              const SizedBox(height: 8),
              Text(
                _nameController.text,
                style: AppTextStyles.subtitle(),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.divider),
                ),
                child: QrImageView(
                  data: _generatedCode!,
                  version: QrVersions.auto,
                  size: 200,
                  eyeStyle: const QrEyeStyle(
                    eyeShape: QrEyeShape.roundedRect,
                    color: AppColors.textPrimary,
                  ),
                  dataModuleStyle: const QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.roundedRect,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  ThinIcon(
                    painter: ClockIconPainter(color: AppColors.textTertiary),
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Válido até: ${_formatExpiry()}',
                    style: AppTextStyles.label(),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  SharePlus.instance.share(
                    ShareParams(
                      text: 'ConGest - Código de Visitante\nNome: ${_nameController.text}\nCódigo: $_generatedCode',
                    ),
                  );
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ThinIcon(
                        painter: ShareIconPainter(color: AppColors.primary),
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Compartilhar',
                        style: AppTextStyles.buttonSecondary(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        PrimaryButton(
          label: 'Gerar Novo Código',
          onPressed: () {
            setState(() {
              _generatedCode = null;
              _nameController.clear();
              _documentController.clear();
              _expiryDate = null;
            });
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  String _formatExpiry() {
    final date = _expiryDate ?? DateTime.now().add(const Duration(hours: 4));
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} às ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

class _RecentVisitorItem extends StatelessWidget {
  final String name;
  final String date;
  final String status;

  const _RecentVisitorItem({
    required this.name,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = status == 'Activo';
    return AppListTile(
      icon: ThinIcon(
        painter: ProfileIconPainter(color: AppColors.accentIndigo),
        size: 18,
      ),
      iconColor: AppColors.accentIndigo,
      iconSize: 36,
      title: name,
      subtitle: date,
      padding: const EdgeInsets.all(14),
      borderColor: null,
      trailing: StatusBadge(
        label: status,
        type: isActive ? BadgeType.success : BadgeType.neutral,
      ),
    );
  }
}
