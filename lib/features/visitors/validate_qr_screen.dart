import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/app_list_tile.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/info_row.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/status_badge.dart';
import '../../shared/widgets/thin_icons.dart';

class ValidateQrScreen extends StatefulWidget {
  const ValidateQrScreen({super.key});

  @override
  State<ValidateQrScreen> createState() => _ValidateQrScreenState();
}

class _ValidateQrScreenState extends State<ValidateQrScreen> {
  bool _isScanning = false;
  _ValidationResult? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: 'Validar QR Code',
              subtitle: 'Verificar código de visitante',
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _result != null
                    ? _buildResult()
                    : _buildScanArea(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanArea() {
    return Column(
      children: [
        const SizedBox(height: 16),
        // Camera viewfinder area
        Container(
          width: double.infinity,
          height: 320,
          decoration: BoxDecoration(
            color: AppColors.black.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.cardBorder, width: 2),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 24,
                left: 24,
                child: _ViewfinderCorner(position: _CornerPosition.topLeft),
              ),
              Positioned(
                top: 24,
                right: 24,
                child: _ViewfinderCorner(position: _CornerPosition.topRight),
              ),
              Positioned(
                bottom: 24,
                left: 24,
                child:
                    _ViewfinderCorner(position: _CornerPosition.bottomLeft),
              ),
              Positioned(
                bottom: 24,
                right: 24,
                child:
                    _ViewfinderCorner(position: _CornerPosition.bottomRight),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: _isScanning
                            ? const SizedBox(
                                width: 28,
                                height: 28,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.primary,
                                ),
                              )
                            : ThinIcon(
                                painter:
                                    QrScanIconPainter(color: AppColors.primary),
                                size: 32,
                              ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _isScanning
                          ? 'A digitalizar...'
                          : 'Aponte a câmara para o QR Code',
                      style: AppTextStyles.subtitle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Manual code entry
        Text(
          'Ou introduza o código manualmente',
          style: AppTextStyles.label(),
        ),
        const SizedBox(height: 12),
        AppTextField(
          hintText: 'Código do visitante',
          backgroundColor: AppColors.white,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),

        PrimaryButton(
          label: 'Validar Código',
          isLoading: _isScanning,
          onPressed: () {
            setState(() => _isScanning = true);
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) {
                setState(() {
                  _isScanning = false;
                  _result = _ValidationResult(
                    visitorName: 'Maria Silva',
                    document: 'BI 012345678LA042',
                    unit: 'Bloco A - Apt 302',
                    resident: 'Carlos Mendes',
                    validUntil: '05/02/2026 às 18:30',
                    isValid: true,
                  );
                });
              }
            });
          },
        ),
        const SizedBox(height: 32),

        // Recent validations
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Validações Recentes', style: AppTextStyles.title()),
          ],
        ),
        const SizedBox(height: 12),
        const _ValidationHistoryItem(
          name: 'Pedro Almeida',
          unit: 'Apt 105',
          time: 'Hoje, 10:32',
          isValid: true,
        ),
        const SizedBox(height: 8),
        const _ValidationHistoryItem(
          name: 'Ana Costa',
          unit: 'Apt 201',
          time: 'Hoje, 09:15',
          isValid: true,
        ),
        const SizedBox(height: 8),
        const _ValidationHistoryItem(
          name: 'Desconhecido',
          unit: '-',
          time: 'Ontem, 22:45',
          isValid: false,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildResult() {
    return Column(
      children: [
        const SizedBox(height: 16),
        AppCard(
          borderRadius: 20,
          padding: const EdgeInsets.all(24),
          borderColor: _result!.isValid
              ? AppColors.success.withValues(alpha: 0.3)
              : AppColors.error.withValues(alpha: 0.3),
          child: Column(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: (_result!.isValid
                          ? AppColors.success
                          : AppColors.error)
                      .withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _result!.isValid
                      ? Icons.check_rounded
                      : Icons.close_rounded,
                  size: 32,
                  color: _result!.isValid
                      ? AppColors.success
                      : AppColors.error,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                _result!.isValid
                    ? 'Visitante Autorizado'
                    : 'Código Inválido',
                style: AppTextStyles.title(
                  color: _result!.isValid
                      ? AppColors.success
                      : AppColors.error,
                ),
              ),
              const SizedBox(height: 24),
              if (_result!.isValid) ...[
                InfoRow(
                  label: 'Visitante',
                  value: _result!.visitorName,
                  labelWidth: 100,
                ),
                const SizedBox(height: 12),
                InfoRow(
                  label: 'Documento',
                  value: _result!.document,
                  labelWidth: 100,
                ),
                const SizedBox(height: 12),
                InfoRow(
                  label: 'Destino',
                  value: _result!.unit,
                  labelWidth: 100,
                ),
                const SizedBox(height: 12),
                InfoRow(
                  label: 'Morador',
                  value: _result!.resident,
                  labelWidth: 100,
                ),
                const SizedBox(height: 12),
                InfoRow(
                  label: 'Válido até',
                  value: _result!.validUntil,
                  labelWidth: 100,
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
        if (_result!.isValid)
          PrimaryButton(
            label: 'Registar Entrada',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Entrada registada com sucesso!'),
                ),
              );
              setState(() => _result = null);
            },
          ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => setState(() => _result = null),
          child: Container(
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.buttonBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Digitalizar Outro',
                style: AppTextStyles.buttonSecondary(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _ValidationResult {
  final String visitorName;
  final String document;
  final String unit;
  final String resident;
  final String validUntil;
  final bool isValid;

  const _ValidationResult({
    required this.visitorName,
    required this.document,
    required this.unit,
    required this.resident,
    required this.validUntil,
    required this.isValid,
  });
}

enum _CornerPosition { topLeft, topRight, bottomLeft, bottomRight }

class _ViewfinderCorner extends StatelessWidget {
  final _CornerPosition position;

  const _ViewfinderCorner({required this.position});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(32, 32),
      painter: _CornerPainter(position: position),
    );
  }
}

class _CornerPainter extends CustomPainter {
  final _CornerPosition position;

  _CornerPainter({required this.position});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final s = size.width;
    switch (position) {
      case _CornerPosition.topLeft:
        canvas.drawLine(Offset(0, s * 0.6), const Offset(0, 0), paint);
        canvas.drawLine(const Offset(0, 0), Offset(s * 0.6, 0), paint);
        break;
      case _CornerPosition.topRight:
        canvas.drawLine(Offset(s * 0.4, 0), Offset(s, 0), paint);
        canvas.drawLine(Offset(s, 0), Offset(s, s * 0.6), paint);
        break;
      case _CornerPosition.bottomLeft:
        canvas.drawLine(Offset(0, s * 0.4), Offset(0, s), paint);
        canvas.drawLine(Offset(0, s), Offset(s * 0.6, s), paint);
        break;
      case _CornerPosition.bottomRight:
        canvas.drawLine(Offset(s * 0.4, s), Offset(s, s), paint);
        canvas.drawLine(Offset(s, s), Offset(s, s * 0.4), paint);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ValidationHistoryItem extends StatelessWidget {
  final String name;
  final String unit;
  final String time;
  final bool isValid;

  const _ValidationHistoryItem({
    required this.name,
    required this.unit,
    required this.time,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      icon: Icon(
        isValid ? Icons.check_rounded : Icons.close_rounded,
        size: 18,
        color: isValid ? AppColors.success : AppColors.error,
      ),
      iconColor: isValid ? AppColors.success : AppColors.error,
      iconSize: 36,
      title: name,
      subtitle: '$unit • $time',
      padding: const EdgeInsets.all(14),
      trailing: StatusBadge(
        label: isValid ? 'Válido' : 'Inválido',
        type: isValid ? BadgeType.success : BadgeType.error,
      ),
    );
  }
}
