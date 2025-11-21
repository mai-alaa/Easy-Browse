

abstract class FacebookAuthState {}

class FacebookAuthInitial extends FacebookAuthState {}

class FacebookAuthLoading extends FacebookAuthState {}

class FacebookAuthSignedIn extends FacebookAuthState {

}

class FacebookAuthError extends FacebookAuthState {
  final String message;
  FacebookAuthError(this.message);
}