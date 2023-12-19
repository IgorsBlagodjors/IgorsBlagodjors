import 'package:flutter/material.dart';

class ItemColorPicker extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;

  const ItemColorPicker({
    super.key,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: 2,
        ),
      ),
    );
  }
}
