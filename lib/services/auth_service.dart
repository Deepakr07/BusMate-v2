import 'package:busmate/view/createProfile.dart';
import 'package:busmate/view/editProfile.dart';
import 'package:busmate/view/signUp.dart';
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
  final _auth = FirebaseAuth.instance;
  final _GoogleSignIn = GoogleSignIn();

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
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _GoogleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
        Get.off(() => CreateProfile());
      }
    } catch (e) {
      // Handle sign-in error
      print('Error signing in with Google: $e');
      Get.offAll(() => SignUp());
    }
  }

  Future<void> signOut() async {
    // Check if the user is signed in with Google.
    final googleSignInAccount = await GoogleSignIn().signInSilently();
    if (googleSignInAccount != null) {
      // Sign out from Google.
      try {
        await FirebaseAuth.instance.signOut();
        await _GoogleSignIn.signOut();
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            Get.offAll(() => SignUp());
            _controller.currentIndex.value = 0;
            print('SignOut Successful');
          }
        });
      } catch (e) {
        print('Error signing out: $e');
        Get.offAll(() => EditProfile());
      }
      // await _GoogleSignIn.signOut();
      // Get.offAll(() => Login());
      // _controller.currentIndex.value = 0;
    }

    // Check if the user is signed in with phone.
    final user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Sign out from Firebase.
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => SignUp());
      _controller.currentIndex.value = 0;
    }
  }

  // void signOut() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //     await _GoogleSignIn.signOut();
  //     FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //       if (user == null) {
  //         Get.offAll(() => Login());
  //         _controller.currentIndex.value = 0;
  //         print('SignOut Successful');
  //       }
  //     });
  //   } catch (e) {
  //     print('Error signing out: $e');
  //     Get.offAll(() => EditProfile());
  //   }
  // }
}
