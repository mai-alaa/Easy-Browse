import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
  bool isInitialized = false;

  // Initialize Google Sign-In
  Future<void> ensureInitialized() async {
    if (!isInitialized) {
      await googleSignIn.initialize();
      isInitialized = true;
    }
  }

  // Google Sign-In Function for Firebase Authentication
  Future<User?> signInWithGoogle() async {
    try {
   
      await ensureInitialized();
      
      // Trigger the Google Sign-In flow using authenticate()
      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();
      
      // If user cancels the sign-in
      if (googleUser == null) {
        log('Google sign-in cancelled by user');
        return null;
      }

      // Get the authentication details
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      
      // Get access token using authorization client
      final authClient = googleSignIn.authorizationClient;
      final authorization = await authClient.authorizationForScopes(['email']);

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: authorization?.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = 
          await auth.signInWithCredential(credential);

      // Return the user
      return userCredential.user;
      
    } catch (e) {
      log('Error during Google sign-in: $e');
      return null;
    }
  }
  // Facebook Sign-In Function for Firebase Authentication
   Future<User?> signInWithFacebook() async {
    try {
      //  Sign in to Facebook
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status != LoginStatus.success) {
        return null;
      }

      final accessToken = result.accessToken;

      //  Convert Facebook token to Firebase credential
      final facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken!.token);

      // Sign in to Firebase
      final userCredential =
          await auth.signInWithCredential(facebookAuthCredential);

      return userCredential.user;

    } catch (e) {
      log("Facebook Sign-in Error: $e");
      return null;
    }
  }

}