import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleAuthState {}

class GoogleAuthInitial extends GoogleAuthState {}

class GoogleAuthLoading extends GoogleAuthState {}

class GoogleAuthSignedIn extends GoogleAuthState {
  final User user;
  GoogleAuthSignedIn(this.user);
}

class GoogleAuthError extends GoogleAuthState {
  final String message;
  GoogleAuthError(this.message);
}