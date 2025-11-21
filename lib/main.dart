import 'package:easy_browse/config/routes/routes.dart';
import 'package:easy_browse/core/utils/screen_size.dart';
import 'package:easy_browse/features/login/data/datasources/google_auth.dart';
import 'package:easy_browse/features/login/presentation/cubit/facebook_auth/facebook_auth_cubit.dart';
import 'package:easy_browse/features/login/presentation/cubit/google_auth/google_auth_cubit.dart';
import 'package:easy_browse/features/settings/presentation/cubits/scan_devices/scan_devices_cubit.dart';
import 'package:easy_browse/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const EasyBrowse());
}

class EasyBrowse extends StatelessWidget {
  const EasyBrowse({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    ScreenSize.init(context);
    return MultiBlocProvider(
       providers: [
        BlocProvider(
          create: (context) => GoogleAuthCubit( authService ),
        ),
        BlocProvider(
          create: (context) => FacebookAuthCubit( authService ),
        ),
        BlocProvider(
          create: (context) => DeviceCubit(),
        ),
    

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
      
        initialRoute: AppRouter.loginScreen,
      ),
    );
  }
}

