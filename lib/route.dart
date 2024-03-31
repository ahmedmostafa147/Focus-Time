import 'package:flutter/material.dart';
import 'package:focus_time/View/home/home.dart';
import 'package:focus_time/View/splash%20screen/splash_screen.dart';

class AppRoute {
  static const String splash = "/splash";
  static const String home = "/home";
  static const String bottomNaveBar = "/bottomNaveBar";
  static const String settings = "/settings";
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.splash: (context) => const SplashScreen(),
  AppRoute.home: (context) =>  Home(),
  
};
