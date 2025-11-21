import 'package:easy_browse/config/routes/routes.dart';
import 'package:easy_browse/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(const EasyBrowse());
}

class EasyBrowse extends StatelessWidget {
  const EasyBrowse({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,

  initialRoute: AppRouter.loginScreen,
    );
  }
}

