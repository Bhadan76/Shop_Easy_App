import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shop_easy/app/app_colors.dart';
import 'package:shop_easy/app/app_route.dart';
import 'package:shop_easy/views/home/home_view.dart';

class ShopEasyApp extends StatelessWidget {
  const ShopEasyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Easy App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
      ),
      initialRoute: HomeView.name,
      getPages: AppRoutes.getPages,
    );
  }
}
