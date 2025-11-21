import 'package:easy_browse/config/routes/routes.dart';
import 'package:easy_browse/core/extentions/int_extentions.dart';
import 'package:easy_browse/core/utils/app_styles.dart';
import 'package:easy_browse/core/utils/common_helper.dart';
import 'package:easy_browse/core/utils/constants.dart';
import 'package:easy_browse/features/login/presentation/cubit/facebook_auth/facebook_auth_cubit.dart';
import 'package:easy_browse/features/login/presentation/cubit/facebook_auth/facebook_auth_state.dart';
import 'package:easy_browse/features/login/presentation/cubit/google_auth/google_auth_cubit.dart';
import 'package:easy_browse/features/login/presentation/cubit/google_auth/google_auth_state.dart';
import 'package:easy_browse/features/login/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
            BlocConsumer<GoogleAuthCubit,GoogleAuthState>(
              listener: (context, state) => {
                if (state is GoogleAuthSignedIn) {
                  Navigator.pushNamed(context, AppRouter.settingsScreen)
                } else if (state is GoogleAuthError) {
                 showToast(state.message, Colors.red)
                }
              },
              builder: (BuildContext context, GoogleAuthState state) { 
                return  CustomButton(text: 'Login With Google', onPressed: (){

                  context.read<GoogleAuthCubit>().gLogin();
              }, color: kGoogleLoginColor, textColor: kBackgroundColor, icon:FontAwesomeIcons.google, isLoading: state is GoogleAuthLoading);
               },
            
            ),
            10.toHeight,
            BlocConsumer<FacebookAuthCubit,FacebookAuthState>(
              listener: (context, state) => {
                if (state is FacebookAuthSignedIn) {
                  Navigator.pushNamed(context, AppRouter.settingsScreen)
                } else if (state is FacebookAuthError) {
                 showToast(state.message, Colors.red)
                }
              },
              builder: ( context,  state) { 
                return  CustomButton(text: 'Login With Facebook', onPressed: (){
                  context.read<FacebookAuthCubit>().fLogin();
                }, color: kFacebookLoginColor, textColor: kBackgroundColor, icon:Icons.facebook, isLoading: state is FacebookAuthLoading);
               },
),
          ],
        ),
      ),
    );
  }
}