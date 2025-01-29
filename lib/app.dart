import 'package:crud_app/resource/app_colors.dart';
import 'package:crud_app/screens/bindings/home_binding.dart';
import 'package:crud_app/screens/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      title: "CRUD APP",
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: AppColors.materialColor,
        primaryColor: AppColors.primaryColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primaryColor,
          selectionColor: AppColors.primaryColor.withValues(alpha: 0.3),
          selectionHandleColor: AppColors.primaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.shadowColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
          ),
          labelStyle: TextStyle(color: AppColors.textColor),
        ),
      ),
    );
  }
}
