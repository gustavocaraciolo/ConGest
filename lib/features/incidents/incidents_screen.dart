import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/status_badge.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/thin_icons.dart';

class IncidentsScreen extends StatelessWidget {
  const IncidentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: 'Ocorrências',
              subtitle: 'Registe e acompanhe problemas',
              onBack: () => Navigator.of(context).pop(),
              trailing: GestureDetector(
                onTap: () => _showNewIncident(context),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: ThinIcon(
                      painter: PlusIconPainter(color: AppColors.white),
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: const [
                  _IncidentCard(
                    title: 'Vazamento no Corredor',
                    description:
                        'Vazamento de água no corredor do 3º andar, perto do apartamento 302. Água acumulando no chão.',
                    category: 'Hidráulica',
                    date: '05 Fev 2026',
                    status: 'Em Análise',
                    statusType: BadgeType.warning,
                  ),
                  SizedBox(height: 8),
                  _IncidentCard(
                    title: 'Lâmpada Queimada',
                    description:
                        'Lâmpada da escadaria entre o 2º e 3º andar está queimada há 3 dias.',
                    category: 'Eléctrica',
                    date: '03 Fev 2026',
                    status: 'Em Resolução',
                    statusType: BadgeType.info,
                  ),
                  SizedBox(height: 8),
                  _IncidentCard(
                    title: 'Portão da Garagem',
                    description:
                        'O portão da garagem está com dificuldade para abrir e fechar. Faz barulho estranho.',
                    category: 'Manutenção',
                    date: '01 Fev 2026',
                    status: 'Resolvido',
                    statusType: BadgeType.success,
                  ),
                  SizedBox(height: 8),
                  _IncidentCard(
                    title: 'Barulho Excessivo',
                    description:
                        'Apartamento 405 com barulho excessivo durante a madrugada, perturbando os vizinhos.',
                    category: 'Convivência',
                    date: '28 Jan 2026',
                    status: 'Resolvido',
                    statusType: BadgeType.success,
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showNewIncident(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _NewIncidentSheet(),
    );
  }
}

class _IncidentCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final String date;
  final String status;
  final BadgeType statusType;

  const _IncidentCard({
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.status,
    required this.statusType,
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
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: ThinIcon(
                    painter: IncidentIconPainter(color: AppColors.error),
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.buttonSecondary()),
                    const SizedBox(height: 2),
                    Text('$category • $date', style: AppTextStyles.label()),
                  ],
                ),
              ),
              StatusBadge(label: status, type: statusType),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: AppTextStyles.subtitle(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _NewIncidentSheet extends StatefulWidget {
  const _NewIncidentSheet();

  @override
  State<_NewIncidentSheet> createState() => _NewIncidentSheetState();
}

class _NewIncidentSheetState extends State<_NewIncidentSheet> {
  String? _selectedCategory;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _categories = [
    'Hidráulica',
    'Eléctrica',
    'Manutenção',
    'Convivência',
    'Segurança',
    'Limpeza',
    'Outro',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Nova Ocorrência', style: AppTextStyles.headingSmall()),
            const SizedBox(height: 20),
            Text('Título', style: AppTextStyles.label()),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: TextField(
                controller: _titleController,
                style: AppTextStyles.body(),
                decoration: InputDecoration(
                  hintText: 'Descreva o problema brevemente',
                  hintStyle:
                      AppTextStyles.body(color: AppColors.textTertiary),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(14),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Categoria', style: AppTextStyles.label()),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _categories.map((cat) {
                final isSelected = cat == _selectedCategory;
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategory = cat),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primary : AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.cardBorder,
                      ),
                    ),
                    child: Text(
                      cat,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? AppColors.white
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Text('Descrição', style: AppTextStyles.label()),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: TextField(
                controller: _descriptionController,
                style: AppTextStyles.body(),
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Detalhe o problema...',
                  hintStyle:
                      AppTextStyles.body(color: AppColors.textTertiary),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(14),
                ),
              ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Registar Ocorrência',
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Ocorrência registada com sucesso!'),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
