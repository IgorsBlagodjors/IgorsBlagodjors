import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:flutter/material.dart';

class SelectedItemCapacity extends StatelessWidget {
  final String currentText;
  final Color? color;
  const SelectedItemCapacity({
    super.key,
    required this.currentText,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      currentText,
      style: AppStyles.font16Weight500.copyWith(
        color: color,
      ),
    );
  }
}
