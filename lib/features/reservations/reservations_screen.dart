import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/app_bottom_sheet.dart';
import '../../shared/widgets/app_list_tile.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/segmented_tab.dart';
import '../../shared/widgets/selection_chip.dart';
import '../../shared/widgets/status_badge.dart';
import '../../shared/widgets/thin_icons.dart';
import '../../shared/widgets/primary_button.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final showBack = ModalRoute.of(context)?.canPop ?? false;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: 'Reservas',
              subtitle: 'Espaços comuns do condomínio',
              onBack: showBack ? () => Navigator.of(context).pop() : null,
              trailing: GestureDetector(
                onTap: () => _showNewReservation(context),
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

            // Tab selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SegmentedTab(
                labels: const ['Minhas', 'Disponíveis'],
                selectedIndex: _selectedTab,
                onChanged: (index) => setState(() => _selectedTab = index),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: _selectedTab == 0
                  ? _MyReservations()
                  : _AvailableSpaces(),
            ),
          ],
        ),
      ),
    );
  }

  void _showNewReservation(BuildContext context) {
    AppBottomSheet.show(
      context: context,
      title: 'Nova Reserva',
      child: const _NewReservationForm(),
    );
  }
}

class _MyReservations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: const [
        _ReservationCard(
          space: 'Churrasqueira',
          date: '08 Fev 2026',
          time: '10:00 - 18:00',
          status: 'Confirmada',
          statusType: BadgeType.success,
        ),
        SizedBox(height: 8),
        _ReservationCard(
          space: 'Salão de Festas',
          date: '15 Fev 2026',
          time: '14:00 - 22:00',
          status: 'Pendente',
          statusType: BadgeType.warning,
        ),
        SizedBox(height: 8),
        _ReservationCard(
          space: 'Quadra Esportiva',
          date: '01 Fev 2026',
          time: '08:00 - 10:00',
          status: 'Concluída',
          statusType: BadgeType.neutral,
        ),
      ],
    );
  }
}

class _AvailableSpaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: const [
        _SpaceCard(
          name: 'Churrasqueira',
          description: 'Área externa com churrasqueira e mesas',
          capacity: '20 pessoas',
          pricePerHour: '5.000 Kz',
        ),
        SizedBox(height: 8),
        _SpaceCard(
          name: 'Salão de Festas',
          description: 'Espaço climatizado com cozinha e banheiros',
          capacity: '80 pessoas',
          pricePerHour: '15.000 Kz',
        ),
        SizedBox(height: 8),
        _SpaceCard(
          name: 'Quadra Esportiva',
          description: 'Quadra poliesportiva coberta',
          capacity: '12 pessoas',
          pricePerHour: '3.000 Kz',
        ),
        SizedBox(height: 8),
        _SpaceCard(
          name: 'Piscina',
          description: 'Piscina adulto e infantil com deck',
          capacity: '30 pessoas',
          pricePerHour: '8.000 Kz',
        ),
        SizedBox(height: 8),
        _SpaceCard(
          name: 'Sala de Reuniões',
          description: 'Sala com projetor e ar condicionado',
          capacity: '15 pessoas',
          pricePerHour: '2.000 Kz',
        ),
        SizedBox(height: 24),
      ],
    );
  }
}

class _ReservationCard extends StatelessWidget {
  final String space;
  final String date;
  final String time;
  final String status;
  final BadgeType statusType;

  const _ReservationCard({
    required this.space,
    required this.date,
    required this.time,
    required this.status,
    required this.statusType,
  });

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      icon: ThinIcon(
        painter: ReservationIconPainter(color: AppColors.accentPurple),
        size: 22,
      ),
      iconColor: AppColors.accentPurple,
      iconSize: 44,
      iconBorderRadius: 12,
      title: space,
      subtitle: '$date • $time',
      trailing: StatusBadge(label: status, type: statusType),
    );
  }
}

class _SpaceCard extends StatelessWidget {
  final String name;
  final String description;
  final String capacity;
  final String pricePerHour;

  const _SpaceCard({
    required this.name,
    required this.description,
    required this.capacity,
    required this.pricePerHour,
  });

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      icon: ThinIcon(
        painter: ReservationIconPainter(color: AppColors.accentPurple),
        size: 22,
      ),
      iconColor: AppColors.accentPurple,
      iconSize: 44,
      iconBorderRadius: 12,
      title: name,
      subtitle: description,
      bottom: Row(
        children: [
          ThinIcon(
            painter: ProfileIconPainter(color: AppColors.textTertiary),
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(capacity, style: AppTextStyles.label()),
          const SizedBox(width: 16),
          ThinIcon(
            painter: ClockIconPainter(color: AppColors.textTertiary),
            size: 14,
          ),
          const SizedBox(width: 4),
          Text('$pricePerHour/hora', style: AppTextStyles.label()),
          const Spacer(),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Reservar',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NewReservationForm extends StatefulWidget {
  const _NewReservationForm();

  @override
  State<_NewReservationForm> createState() => _NewReservationFormState();
}

class _NewReservationFormState extends State<_NewReservationForm> {
  String? _selectedSpace;
  DateTime? _selectedDate;

  final _spaces = [
    'Churrasqueira',
    'Salão de Festas',
    'Quadra Esportiva',
    'Piscina',
    'Sala de Reuniões',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Espaço', style: AppTextStyles.label()),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _spaces.map((space) {
            return SelectionChip(
              label: space,
              isSelected: space == _selectedSpace,
              onTap: () => setState(() => _selectedSpace = space),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        Text('Data', style: AppTextStyles.label()),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now().add(const Duration(days: 1)),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 90)),
            );
            if (date != null) {
              setState(() => _selectedDate = date);
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Row(
              children: [
                ThinIcon(
                  painter: ReservationIconPainter(
                    color: AppColors.textTertiary,
                  ),
                  size: 18,
                ),
                const SizedBox(width: 10),
                Text(
                  _selectedDate != null
                      ? '${_selectedDate!.day.toString().padLeft(2, '0')}/${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.year}'
                      : 'Selecionar data',
                  style: AppTextStyles.body(
                    color: _selectedDate != null
                        ? AppColors.textPrimary
                        : AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          label: 'Solicitar Reserva',
          onPressed: _selectedSpace != null && _selectedDate != null
              ? () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Reserva solicitada com sucesso!'),
                    ),
                  );
                }
              : null,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
