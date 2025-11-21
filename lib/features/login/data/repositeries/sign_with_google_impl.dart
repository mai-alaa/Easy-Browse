import 'package:easy_browse/features/login/data/datasources/google_auth.dart';
import 'package:easy_browse/features/login/domain/repositories/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignWithGoogleImpl implements AuthRepo {
  final AuthService authService;

  SignWithGoogleImpl(this.authService);

  @override
  Future<User?> signInWithGoogle() async {
    return await authService.signInWithGoogle();
  }
  
  @override
  Future<User?> signInWithFacebook() async {
    return await authService.signInWithFacebook();
  }
}