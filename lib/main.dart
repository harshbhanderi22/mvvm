import 'package:flutter/material.dart';
import 'package:mvvm/utils/Routes/routes_name.dart';
import 'package:mvvm/utils/Routes/routes.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthViewModel(),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.login,
          onGenerateRoute: Routes.generateRoutes,
        ));
  }
}
