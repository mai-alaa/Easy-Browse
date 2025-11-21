import 'package:easy_browse/features/login/presentation/screens/login_screen.dart';
import 'package:easy_browse/features/settings/presentation/screens/settings_screen.dart';
import 'package:easy_browse/features/settings/presentation/screens/web_view_screen.dart';
import 'package:flutter/material.dart';

class  AppRouter {
  static const String loginScreen = '/login';
  static const String settingsScreen = '/settings';
  static const String webViewScreen = '/webview';
static Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case AppRouter.loginScreen:
      return MaterialPageRoute(builder: (context)=> const LoginScreen());
    case AppRouter.settingsScreen:
      return MaterialPageRoute(builder: (context)=>  SettingsScreen());
    case AppRouter.webViewScreen:
      return MaterialPageRoute(builder: (context)=>  WebViewScreen(url: settings.arguments as String));
    default:
      return MaterialPageRoute(builder: (context)=> const LoginScreen());
  }
  
}
}