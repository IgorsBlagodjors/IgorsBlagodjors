import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/presentation/pages/search_screens/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.themeColorWhite,
      ),
      home: const Search(),
    ),
  );
}
