import 'package:api_rest_ui/helpers/dependency_injection.dart';
import 'package:api_rest_ui/pages/home_page.dart';
import 'package:api_rest_ui/pages/login_page.dart';
import 'package:api_rest_ui/pages/registro_page.dart';
import 'package:api_rest_ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  DependencyInjection.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      routes: {
        RegisterPage.routeName: (_) => RegisterPage(),
        LoginPage.routeName: (_) => LoginPage(),
        HomePage.routeName: (_) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
