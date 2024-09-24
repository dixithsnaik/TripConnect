import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';


class SignInController extends GetxController {
  // Observable variables
  var checkbox = false.obs;
  var isLoading = false.obs;
  String userId = FirebaseAuth.instance.currentUser?.uid ?? "";

  // Firebase Auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Google Sign-In instance
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  final googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        print(">>> accessToken");
        print(googleSignInAuthentication.accessToken);
        print(">>> idToken");
        print(googleSignInAuthentication.idToken);

        if (googleSignInAuthentication.accessToken != null &&
            googleSignInAuthentication.idToken != null) {
          // Creating the credential using the updated method
          final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken,
          );

          // Sign in to Firebase with the credential
          final UserCredential authResult =
              await FirebaseAuth.instance.signInWithCredential(credential);

          storeTokens(googleSignInAuthentication.idToken,
              googleSignInAuthentication.accessToken);

          final User? user = authResult.user;

          return user; // Return the User object from Firebase
        } else {
          throw FirebaseAuthException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
            message: 'Missing Google Auth Token',
          );
        }
      } else {
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      }
    } catch (error) {
      print('Sign in failed: $error');
      return null; // Handle the error accordingly
    }
  }

  void storeTokens(String? idToken, String? accessToken) {
    final storage = GetStorage();
    storage.write('id_token', idToken);
    storage.write('access_token', accessToken);
    print(GetStorage().read('id_token'));
    print(GetStorage().read('access_token'));
  }

  Future<User?> signInWithApple() async {
    try {
      // Request the Apple ID credential
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Create OAuth credential for Apple Sign-In
      final OAuthProvider oAuthProvider = OAuthProvider("apple.com");
      final AuthCredential credential = oAuthProvider.credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      // Sign in to Firebase with the credential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      storeTokens(
          appleCredential.identityToken, appleCredential.authorizationCode);

      final User? user = userCredential.user;

      return user; // Return the User object from Firebase
    } catch (error) {
      print('Apple sign in failed: $error');
      return null; // Handle the error accordingly
    }
  }

  Future<void> signOut() async {
    try {
      isLoading.value = true;

      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Sign out from Google Sign-In if the user signed in with Google
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
      }

      // Optionally reset the userId and other variables
      userId = "";
      checkbox.value = false;
      final storage = GetStorage();
      storage.remove('id_token');
      storage.remove('access_token');

      Fluttertoast.showToast(
        msg: "Signed out successfully.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error signing out. Please try again.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
