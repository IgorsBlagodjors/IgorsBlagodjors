import 'package:dio/dio.dart';
import 'package:fake_tech_store/date/electronics_api_client.dart';
import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/domain/network_electronics_repository.dart';
import 'package:fake_tech_store/domain/repository.dart';
import 'package:fake_tech_store/presentation/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://dummyjson.com/'),
  );
  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
    ),
  );

  final electronicsApiClient = ElectronicsApiClient(dio);
  final networkRepository = NetworkElectronicsRepository(electronicsApiClient);
  final electronicsRepositoryProvider =
      RepositoryProvider<ElectronicsRepository>(
          create: (context) => networkRepository);
  runApp(
    MultiRepositoryProvider(
      providers: [electronicsRepositoryProvider],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.themeColorWhite,
        ),
        home: const AppBottomNavigationBar(),
      ),
    ),
  );
}
