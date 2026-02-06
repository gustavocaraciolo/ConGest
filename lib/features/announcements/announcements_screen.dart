import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/app_list_tile.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/status_badge.dart';
import '../../shared/widgets/thin_icons.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final showBack = ModalRoute.of(context)?.canPop ?? false;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: 'Comunicados',
              centerTitle: true,
              onBack: showBack ? () => Navigator.of(context).pop() : null,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: const [
                  _AnnouncementCard(
                    title: 'Manutenção do Elevador',
                    body:
                        'Informamos que o elevador do Bloco A estará em manutenção preventiva no dia 10 de Fevereiro, das 08:00 às 17:00. Pedimos desculpa pelo incómodo.',
                    author: 'Administração',
                    date: '05 Fev 2026',
                    isNew: true,
                    priority: 'Importante',
                    priorityType: BadgeType.warning,
                  ),
                  SizedBox(height: 12),
                  _AnnouncementCard(
                    title: 'Assembleia Geral Ordinária',
                    body:
                        'Convocamos todos os condóminos para a Assembleia Geral Ordinária que se realizará no dia 20 de Fevereiro às 19:00 no Salão de Festas. Pauta: Prestação de contas 2025 e orçamento 2026.',
                    author: 'Administração',
                    date: '03 Fev 2026',
                    isNew: true,
                    priority: 'Urgente',
                    priorityType: BadgeType.error,
                  ),
                  SizedBox(height: 12),
                  _AnnouncementCard(
                    title: 'Horário da Piscina',
                    body:
                        'A piscina do condomínio funcionará em horário estendido durante o verão: 07:00 às 21:00, de segunda a domingo.',
                    author: 'Administração',
                    date: '01 Fev 2026',
                    isNew: true,
                  ),
                  SizedBox(height: 12),
                  _AnnouncementCard(
                    title: 'Recolha de Lixo',
                    body:
                        'Lembramos que a recolha de lixo reciclável acontece às terças e quintas-feiras. Favor separar os resíduos corretamente.',
                    author: 'Administração',
                    date: '28 Jan 2026',
                    isNew: false,
                  ),
                  SizedBox(height: 12),
                  _AnnouncementCard(
                    title: 'Pintura das Áreas Comuns',
                    body:
                        'Iniciamos a pintura das áreas comuns do Bloco B. A obra tem previsão de 5 dias úteis. Agradecemos a compreensão.',
                    author: 'Administração',
                    date: '25 Jan 2026',
                    isNew: false,
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
}

class _AnnouncementCard extends StatelessWidget {
  final String title;
  final String body;
  final String author;
  final String date;
  final bool isNew;
  final String? priority;
  final BadgeType? priorityType;

  const _AnnouncementCard({
    required this.title,
    required this.body,
    required this.author,
    required this.date,
    this.isNew = false,
    this.priority,
    this.priorityType,
  });

  @override
  Widget build(BuildContext context) {
    Widget? trailing;
    if (priority != null) {
      trailing = StatusBadge(
        label: priority!,
        type: priorityType ?? BadgeType.neutral,
      );
    } else if (isNew) {
      trailing = Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
      );
    }

    return AppListTile(
      icon: ThinIcon(
        painter: AnnouncementIconPainter(color: AppColors.accentOrange),
        size: 24,
      ),
      title: title,
      subtitle: '$author • $date',
      trailing: trailing,
      borderColor: isNew
          ? AppColors.primary.withValues(alpha: 0.3)
          : null,
      bottom: Text(
        body,
        style: AppTextStyles.subtitle(),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
