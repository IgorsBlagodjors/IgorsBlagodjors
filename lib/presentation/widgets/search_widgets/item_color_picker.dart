import 'package:flutter/material.dart';

class ItemColorPicker extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final void Function() onTap;

  const ItemColorPicker({
    super.key,
    this.backgroundColor,
    this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
