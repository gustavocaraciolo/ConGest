import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../shared/widgets/thin_icons.dart';

class Condominium {
  final String id;
  final String name;
  final String unit;

  const Condominium({
    required this.id,
    required this.name,
    required this.unit,
  });
}

class CondominiumSelector extends StatelessWidget {
  final Condominium selectedCondominium;
  final List<Condominium> condominiums;
  final ValueChanged<Condominium> onChanged;

  const CondominiumSelector({
    super.key,
    required this.selectedCondominium,
    required this.condominiums,
    required this.onChanged,
  });

  void _showSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _CondominiumSelectionSheet(
        condominiums: condominiums,
        selectedCondominium: selectedCondominium,
        onSelected: (condominium) {
          Navigator.of(context).pop();
          onChanged(condominium);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSelectionSheet(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: BuildingIcon(
                size: 20,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedCondominium.name,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                  color: AppColors.cardDark,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                selectedCondominium.unit,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.43,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 24,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}

class _CondominiumSelectionSheet extends StatelessWidget {
  final List<Condominium> condominiums;
  final Condominium selectedCondominium;
  final ValueChanged<Condominium> onSelected;

  const _CondominiumSelectionSheet({
    required this.condominiums,
    required this.selectedCondominium,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Selecionar Condomínio',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...condominiums.map((condominium) => _CondominiumOption(
                  condominium: condominium,
                  isSelected: condominium.id == selectedCondominium.id,
                  onTap: () => onSelected(condominium),
                )),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _CondominiumOption extends StatelessWidget {
  final Condominium condominium;
  final bool isSelected;
  final VoidCallback onTap;

  const _CondominiumOption({
    required this.condominium,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : AppColors.sectionBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: BuildingIcon(
                  size: 20,
                  color: isSelected ? AppColors.primary : AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    condominium.name,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? AppColors.primary : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    condominium.unit,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 16,
                  color: AppColors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
