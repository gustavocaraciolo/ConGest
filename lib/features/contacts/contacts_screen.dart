import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../shared/widgets/screen_header.dart';
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
                  _ContactSection(
                    title: 'Administração',
                    contacts: const [
                      _ContactData(
                        name: 'Administração Geral',
                        role: 'Gestor do Condomínio',
                        phone: '+244 923 456 789',
                        email: 'admin@congest.ao',
                      ),
                      _ContactData(
                        name: 'Secretaria',
                        role: 'Atendimento ao Condómino',
                        phone: '+244 923 456 790',
                        email: 'secretaria@congest.ao',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _ContactSection(
                    title: 'Segurança',
                    contacts: const [
                      _ContactData(
                        name: 'Portaria Principal',
                        role: '24 horas',
                        phone: '+244 923 456 791',
                      ),
                      _ContactData(
                        name: 'Segurança Patrimonial',
                        role: 'Rondas e Monitoramento',
                        phone: '+244 923 456 792',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _ContactSection(
                    title: 'Manutenção',
                    contacts: const [
                      _ContactData(
                        name: 'Manutenção Geral',
                        role: 'Reparações e Serviços',
                        phone: '+244 923 456 793',
                      ),
                      _ContactData(
                        name: 'Electricista',
                        role: 'Emergências Eléctricas',
                        phone: '+244 923 456 794',
                      ),
                      _ContactData(
                        name: 'Canalizador',
                        role: 'Emergências Hidráulicas',
                        phone: '+244 923 456 795',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _ContactSection(
                    title: 'Emergência',
                    contacts: const [
                      _ContactData(
                        name: 'Bombeiros',
                        role: 'Corpo de Bombeiros',
                        phone: '115',
                        isEmergency: true,
                      ),
                      _ContactData(
                        name: 'Polícia',
                        role: 'Polícia Nacional',
                        phone: '113',
                        isEmergency: true,
                      ),
                      _ContactData(
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

class _ContactData {
  final String name;
  final String role;
  final String phone;
  final String? email;
  final bool isEmergency;

  const _ContactData({
    required this.name,
    required this.role,
    required this.phone,
    this.email,
    this.isEmergency = false,
  });
}

class _ContactSection extends StatelessWidget {
  final String title;
  final List<_ContactData> contacts;

  const _ContactSection({
    required this.title,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.title()),
        const SizedBox(height: 8),
        ...contacts.map((contact) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _ContactCard(contact: contact),
            )),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  final _ContactData contact;

  const _ContactCard({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: contact.isEmergency
              ? AppColors.error.withValues(alpha: 0.3)
              : AppColors.cardBorder,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: (contact.isEmergency
                      ? AppColors.error
                      : AppColors.accentTeal)
                  .withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: contact.isEmergency
                  ? ThinIcon(
                      painter: IncidentIconPainter(color: AppColors.error),
                      size: 22,
                    )
                  : ThinIcon(
                      painter: ContactsIconPainter(
                        color: AppColors.accentTeal,
                      ),
                      size: 22,
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.name, style: AppTextStyles.buttonSecondary()),
                const SizedBox(height: 2),
                Text(contact.role, style: AppTextStyles.label()),
              ],
            ),
          ),
          Column(
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
                  contact.phone,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
              if (contact.email != null) ...[
                const SizedBox(height: 4),
                Text(
                  contact.email!,
                  style: AppTextStyles.label(color: AppColors.primary),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
