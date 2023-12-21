import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final String hint;
  const EditText({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: AppColors.whiteColor,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greyColor,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        hintText: hint,
        contentPadding: const EdgeInsets.only(
          left: 16,
          top: 8,
        ),
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xFFA7A9BE),
        ),
      ),
    );
  }
}
