import 'package:easy_browse/config/routes/routes.dart';
import 'package:easy_browse/core/extentions/int_extentions.dart';
import 'package:easy_browse/core/utils/app_styles.dart';
import 'package:easy_browse/core/utils/constants.dart';
import 'package:easy_browse/features/login/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Text('Login', style: Styles.bold34(context)),
            10.toHeight,
            CustomButton(text: 'Login With Google', onPressed: (){
              Navigator.pushNamed(context, AppRouter.settingsScreen);
            }, color: kGoogleLoginColor, textColor: kBackgroundColor, icon:FontAwesomeIcons.google),
            10.toHeight,
            CustomButton(text: 'Login With Facebook', onPressed: (){}, color: kFacebookLoginColor, textColor: kBackgroundColor, icon:Icons.facebook),
          ],
        ),
      ),
    );
  }
}