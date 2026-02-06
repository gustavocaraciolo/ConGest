import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/app_list_tile.dart';
import '../../shared/widgets/screen_header.dart';
import '../../shared/widgets/section_group.dart';
import '../../shared/widgets/thin_icons.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            ScreenHeader(
              title: 'Contactos',
              subtitle: 'Contactos úteis do condomínio',
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  SectionGroup(
                    title: 'Administração',
                    children: const [
                      _ContactCard(
                        name: 'Administração Geral',
                        role: 'Gestor do Condomínio',
                        phone: '+244 923 456 789',
                        email: 'admin@congest.ao',
                      ),
                      _ContactCard(
                        name: 'Secretaria',
                        role: 'Atendimento ao Condómino',
                        phone: '+244 923 456 790',
                        email: 'secretaria@congest.ao',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SectionGroup(
                    title: 'Segurança',
                    children: const [
                      _ContactCard(
                        name: 'Portaria Principal',
                        role: '24 horas',
                        phone: '+244 923 456 791',
                      ),
                      _ContactCard(
                        name: 'Segurança Patrimonial',
                        role: 'Rondas e Monitoramento',
                        phone: '+244 923 456 792',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SectionGroup(
                    title: 'Manutenção',
                    children: const [
                      _ContactCard(
                        name: 'Manutenção Geral',
                        role: 'Reparações e Serviços',
                        phone: '+244 923 456 793',
                      ),
                      _ContactCard(
                        name: 'Electricista',
                        role: 'Emergências Eléctricas',
                        phone: '+244 923 456 794',
                      ),
                      _ContactCard(
                        name: 'Canalizador',
                        role: 'Emergências Hidráulicas',
                        phone: '+244 923 456 795',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SectionGroup(
                    title: 'Emergência',
                    children: const [
                      _ContactCard(
                        name: 'Bombeiros',
                        role: 'Corpo de Bombeiros',
                        phone: '115',
                        isEmergency: true,
                      ),
                      _ContactCard(
                        name: 'Polícia',
                        role: 'Polícia Nacional',
                        phone: '113',
                        isEmergency: true,
                      ),
                      _ContactCard(
                        name: 'Ambulância',
                        role: 'Serviço de Urgência Médica',
                        phone: '112',
                        isEmergency: true,
                      ),
                    ],
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

class _ContactCard extends StatelessWidget {
  final String name;
  final String role;
  final String phone;
  final String? email;
  final bool isEmergency;

  const _ContactCard({
    required this.name,
    required this.role,
    required this.phone,
    this.email,
    this.isEmergency = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isEmergency ? AppColors.error : AppColors.accentTeal;

    return AppListTile(
      icon: ThinIcon(
        painter: isEmergency
            ? IncidentIconPainter(color: color)
            : ContactsIconPainter(color: color),
        size: 24,
      ),
      title: name,
      subtitle: role,
      padding: const EdgeInsets.all(14),
      borderColor: isEmergency
          ? AppColors.error.withValues(alpha: 0.3)
          : null,
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              phone,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
          if (email != null) ...[
            const SizedBox(height: 4),
            Text(
              email!,
              style: AppTextStyles.label(color: AppColors.primary),
            ),
          ],
        ],
      ),
    );
  }
}
