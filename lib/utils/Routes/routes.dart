import 'package:flutter/material.dart';
import 'package:mvvm/utils/Routes/routes_name.dart';
 import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text("No Routes Defined")),
                ));
    }
  }
}
