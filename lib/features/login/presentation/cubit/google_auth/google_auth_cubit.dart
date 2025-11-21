import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:easy_browse/features/login/data/datasources/google_auth.dart';
import 'package:easy_browse/features/login/presentation/cubit/google_auth/google_auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  final AuthService authService;
	GoogleAuthCubit(this.authService) : super(GoogleAuthInitial());
	
	Future<void> gLogin() async {
    emit(GoogleAuthLoading());

		try {
		 final User? user = await authService.signInWithGoogle();
      if (user != null) {
        emit(GoogleAuthSignedIn(user));
	
      }else {
        emit(GoogleAuthError('Google sign-in failed'));
      }
	
	
		} catch (error) {
            emit(GoogleAuthError('Sign-in failed: $e'));

		
		}
	}
}
