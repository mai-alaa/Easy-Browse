import 'package:easy_browse/features/login/presentation/screens/login_screen.dart';
import 'package:easy_browse/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class  AppRouter {
  static const String loginScreen = '/login';
  static const String settingsScreen = '/settings';
static Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case AppRouter.loginScreen:
      return MaterialPageRoute(builder: (context)=> const LoginScreen());
    case AppRouter.settingsScreen:
      return MaterialPageRoute(builder: (context)=>  SettingsScreen());
    default:
      return MaterialPageRoute(builder: (context)=> const LoginScreen());
  }
  
}
}