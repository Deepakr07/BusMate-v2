import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:busmate/view/home.dart';
import 'package:busmate/view/getstarted.dart';
import 'package:get/get.dart';
import 'package:busmate/view/login.dart';
import '../controller/bottomNavBarController.dart';

class AuthService {
  final BottomNavBarController _controller = Get.find();
  HandleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return GetStarted();
        }
      },
    );
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // User signed in successfully, navigate to the homepage
      Get.off(() => HomePage());
    } catch (e) {
      // Handle sign-in error
      print('Error signing in with Google: $e');
      Get.offAll(() => Login());
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => Login());
    _controller.currentIndex.value = 0;
  }
}
