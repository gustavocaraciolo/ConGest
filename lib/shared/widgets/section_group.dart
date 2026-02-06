import 'package:flutter/material.dart';
import '../../app/theme/app_text_styles.dart';

class SectionGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final double spacing;

  const SectionGroup({
    super.key,
    required this.title,
    required this.children,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.title()),
        const SizedBox(height: 8),
        ...children.map((child) => Padding(
              padding: EdgeInsets.only(bottom: spacing),
              child: child,
            )),
      ],
    );
  }
}
