import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_bank/consts.dart';
import 'package:getx_bank/presentation/controllers/balance_building.dart';
import 'package:getx_bank/presentation/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: BalanceBinding(),
      theme: _themeData,
      home: HomePage(),
    );
  }
}

ThemeData get _themeData {
  return ThemeData(
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.primaryLight,
    backgroundColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      color: AppColors.primary,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleSmall:  TextStyle(color: AppColors.white, fontSize: 16.0),
      titleMedium:  TextStyle(color: AppColors.white, fontSize: 26.0),
      titleLarge:  TextStyle(color: AppColors.white, fontSize: 55.0, fontWeight: FontWeight.w600),
    ),
  );
}
