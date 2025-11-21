import 'package:easy_browse/features/login/domain/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithGoogle {
  final AuthRepo authRepo;
  LoginWithGoogle(this.authRepo);
  Future<User?> call() async {
    return await authRepo.signInWithGoogle();
  }

}
