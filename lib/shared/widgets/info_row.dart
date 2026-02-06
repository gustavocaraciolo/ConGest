import 'package:flutter/material.dart';
import '../../app/theme/app_text_styles.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final double labelWidth;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.labelWidth = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: labelWidth,
          child: Text(label, style: AppTextStyles.label()),
        ),
        Expanded(
          child: Text(value, style: AppTextStyles.subtitle()),
        ),
      ],
    );
  }
}
