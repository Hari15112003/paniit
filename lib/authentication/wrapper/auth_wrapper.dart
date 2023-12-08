import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/authentication/auth/signin.dart';
import 'package:name/authentication/start/splash_screen.dart';
import 'package:name/main.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the auth state
          return const CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data is User) {
          // User is signed in, navigate to the desired page
          return const SplashScreen();
          // return const SplashScreen(); // Replace YourHomePage with the actual home page widget
        } else {
          // User is not signed in, navigate to the sign-in screen
          return const SignInPage(); // Replace YourSignInScreen with the actual sign-in screen widget
        }
      },
    );
  }
}
