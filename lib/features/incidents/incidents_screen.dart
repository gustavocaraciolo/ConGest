import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/app_bottom_sheet.dart';
import '../../shared/widgets/app_list_tile.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/selection_chip.dart';
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
    AppBottomSheet.show(
      context: context,
      title: 'Nova Ocorrência',
      child: const _NewIncidentForm(),
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
    return AppListTile(
      icon: ThinIcon(
        painter: IncidentIconPainter(color: AppColors.error),
        size: 20,
      ),
      iconColor: AppColors.error,
      title: title,
      subtitle: '$category • $date',
      trailing: StatusBadge(label: status, type: statusType),
      bottom: Text(
        description,
        style: AppTextStyles.subtitle(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _NewIncidentForm extends StatefulWidget {
  const _NewIncidentForm();

  @override
  State<_NewIncidentForm> createState() => _NewIncidentFormState();
}

class _NewIncidentFormState extends State<_NewIncidentForm> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Título', style: AppTextStyles.label()),
        const SizedBox(height: 8),
        AppTextField(
          controller: _titleController,
          hintText: 'Descreva o problema brevemente',
        ),
        const SizedBox(height: 16),
        Text('Categoria', style: AppTextStyles.label()),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _categories.map((cat) {
            return SelectionChip(
              label: cat,
              isSelected: cat == _selectedCategory,
              onTap: () => setState(() => _selectedCategory = cat),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Text('Descrição', style: AppTextStyles.label()),
        const SizedBox(height: 8),
        AppTextField(
          controller: _descriptionController,
          hintText: 'Detalhe o problema...',
          maxLines: 4,
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
    );
  }
}
