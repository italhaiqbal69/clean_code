import 'package:clean_code_architechture/utils/routes/routes_name.dart';
import 'package:clean_code_architechture/view/Home_screen.dart';
import 'package:clean_code_architechture/view/login_Screen.dart';
import 'package:clean_code_architechture/view/signup_view.dart';
import 'package:clean_code_architechture/view/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (ctx) => const Home_Screen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (ctx) => const Login_Screen());
      case RouteNames.signup:
        return MaterialPageRoute(builder: (ctx) => const SignupView());
      case RouteNames.splash:
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No routes Found'),
            ),
          );
        });
    }
  }
}
