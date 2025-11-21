import 'package:easy_browse/features/login/data/datasources/google_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_browse/features/login/presentation/cubit/facebook_auth/facebook_auth_state.dart';

class FacebookAuthCubit extends Cubit<FacebookAuthState> {
  final AuthService authService;
	FacebookAuthCubit(this.authService) : super(FacebookAuthInitial());
	
	Future<void> fLogin() async {
  
    emit(FacebookAuthLoading());
	
		try {
      final user = await  authService.signInWithFacebook();
        if (user != null) {
          emit(FacebookAuthSignedIn());
        } else {
          emit(FacebookAuthError('Facebook sign-in failed'));
        }

		 
		} catch (error) {
		  emit(FacebookAuthError(error.toString()));
		}
	}
}
