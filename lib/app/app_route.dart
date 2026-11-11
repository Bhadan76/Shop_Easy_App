import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../views/home/home_view.dart';

class AppRoutes {
  static List<GetPage> getPages = [
    GetPage(name: HomeView.name, page: () => const HomeView()),
  ];

  static Route<dynamic> routes(RouteSettings settings) {
    Widget route = const SizedBox();
    if (settings.name == HomeView.name) {
      route = const HomeView();
    } else {
      route = Scaffold(
        body: Center(child: Text('Route not found: ${settings.name}')),
      );
    }

    return MaterialPageRoute(builder: (ctx) => route);
  }
}
