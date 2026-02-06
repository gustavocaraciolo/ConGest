import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/status_badge.dart';
import '../../shared/widgets/thin_icons.dart';

class PollsScreen extends StatelessWidget {
  const PollsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: 'Votações',
              subtitle: 'Participe das decisões do condomínio',
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: const [
                  _PollCard(
                    title: 'Instalação de Câmaras de Segurança',
                    description:
                        'Proposta para instalar câmaras de segurança nas áreas comuns e garagem do condomínio.',
                    endDate: '15 Fev 2026',
                    isActive: true,
                    totalVotes: 28,
                    totalResidents: 40,
                    options: [
                      _PollOption(label: 'A Favor', votes: 20, percentage: 71),
                      _PollOption(label: 'Contra', votes: 5, percentage: 18),
                      _PollOption(label: 'Abstenção', votes: 3, percentage: 11),
                    ],
                    hasVoted: false,
                  ),
                  SizedBox(height: 12),
                  _PollCard(
                    title: 'Horário do Salão de Festas',
                    description:
                        'Alterar o horário de funcionamento do salão de festas para até às 00:00 nos fins de semana.',
                    endDate: '10 Fev 2026',
                    isActive: true,
                    totalVotes: 35,
                    totalResidents: 40,
                    options: [
                      _PollOption(label: 'A Favor', votes: 22, percentage: 63),
                      _PollOption(label: 'Contra', votes: 10, percentage: 29),
                      _PollOption(label: 'Abstenção', votes: 3, percentage: 8),
                    ],
                    hasVoted: true,
                    selectedOption: 'A Favor',
                  ),
                  SizedBox(height: 12),
                  _PollCard(
                    title: 'Pintura da Fachada',
                    description:
                        'Aprovação do orçamento de 2.500.000 Kz para pintura completa da fachada do edifício.',
                    endDate: '25 Jan 2026',
                    isActive: false,
                    totalVotes: 38,
                    totalResidents: 40,
                    options: [
                      _PollOption(label: 'A Favor', votes: 30, percentage: 79),
                      _PollOption(label: 'Contra', votes: 6, percentage: 16),
                      _PollOption(label: 'Abstenção', votes: 2, percentage: 5),
                    ],
                    hasVoted: true,
                    selectedOption: 'A Favor',
                    result: 'Aprovada',
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

class _PollOption {
  final String label;
  final int votes;
  final int percentage;

  const _PollOption({
    required this.label,
    required this.votes,
    required this.percentage,
  });
}

class _PollCard extends StatefulWidget {
  final String title;
  final String description;
  final String endDate;
  final bool isActive;
  final int totalVotes;
  final int totalResidents;
  final List<_PollOption> options;
  final bool hasVoted;
  final String? selectedOption;
  final String? result;

  const _PollCard({
    required this.title,
    required this.description,
    required this.endDate,
    required this.isActive,
    required this.totalVotes,
    required this.totalResidents,
    required this.options,
    required this.hasVoted,
    this.selectedOption,
    this.result,
  });

  @override
  State<_PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<_PollCard> {
  String? _selectedOption;
  bool _hasVoted = false;

  @override
  void initState() {
    super.initState();
    _hasVoted = widget.hasVoted;
    _selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    Widget statusWidget;
    if (widget.result != null) {
      statusWidget = StatusBadge(label: widget.result!, type: BadgeType.success);
    } else if (widget.isActive) {
      statusWidget = const StatusBadge(label: 'Aberta', type: BadgeType.info);
    } else {
      statusWidget = const StatusBadge(label: 'Encerrada', type: BadgeType.neutral);
    }

    return AppCard(
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ThinIcon(
                painter: PollIconPainter(color: AppColors.accentPurple),
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(widget.title, style: AppTextStyles.buttonSecondary()),
              ),
              statusWidget,
            ],
          ),
          const SizedBox(height: 10),
          Text(
            widget.description,
            style: AppTextStyles.subtitle(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 14),

          // Options / Results
          ...widget.options.map((option) {
            final isSelected = _selectedOption == option.label;
            final showResults = _hasVoted || !widget.isActive;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GestureDetector(
                onTap: widget.isActive && !_hasVoted
                    ? () => setState(() => _selectedOption = option.label)
                    : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected && !showResults
                        ? AppColors.primary.withValues(alpha: 0.08)
                        : AppColors.surface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected && !showResults
                          ? AppColors.primary
                          : AppColors.cardBorder,
                    ),
                  ),
                  child: Row(
                    children: [
                      if (!showResults)
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textTertiary,
                              width: 1.5,
                            ),
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  size: 14,
                                  color: AppColors.white,
                                )
                              : null,
                        ),
                      if (!showResults) const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  option.label,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                if (showResults)
                                  Text(
                                    '${option.votes} votos (${option.percentage}%)',
                                    style: AppTextStyles.label(),
                                  ),
                              ],
                            ),
                            if (showResults) ...[
                              const SizedBox(height: 6),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: option.percentage / 100,
                                  minHeight: 6,
                                  backgroundColor:
                                      AppColors.divider,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    isSelected
                                        ? AppColors.primary
                                        : AppColors.textTertiary
                                            .withValues(alpha: 0.4),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

          if (widget.isActive && !_hasVoted && _selectedOption != null) ...[
            const SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  setState(() => _hasVoted = true);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Voto registado!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Confirmar Voto',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],

          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ThinIcon(
                    painter: ProfileIconPainter(color: AppColors.textTertiary),
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.totalVotes}/${widget.totalResidents} votaram',
                    style: AppTextStyles.label(),
                  ),
                ],
              ),
              Row(
                children: [
                  ThinIcon(
                    painter: ClockIconPainter(color: AppColors.textTertiary),
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.isActive
                        ? 'Até ${widget.endDate}'
                        : 'Encerrada em ${widget.endDate}',
                    style: AppTextStyles.label(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
