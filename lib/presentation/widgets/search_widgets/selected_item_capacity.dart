import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:flutter/material.dart';

class SelectedItemCapacity extends StatelessWidget {
  final String currentText;
  final bool isSelected;
  const SelectedItemCapacity({
    super.key,
    required this.currentText,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      currentText,
      style: isSelected == true ? AppStyles.body1darkBlue : AppStyles.bodyGrey,
    );
  }
}
