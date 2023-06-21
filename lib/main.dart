import 'package:busmate/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:busmate/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:busmate/services/auth_service.dart';
import 'package:busmate/controller/bottomNavBarController.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EasySplashScreen(
        logo: Image.asset(
          './assets/BM-logo.png',
          scale: 0.7,
        ),
        logoWidth: 200,
        backgroundColor: kGreenMainTheme,
        durationInSeconds: 1,
        navigator: BusMate(),
      ),
    ),
  );
}

class BusMate extends StatelessWidget {
  final BottomNavBarController _controller = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home, // Set the initial route
      getPages: AppRoutes.routes,
      home: AuthService().HandleAuthState(),
    );
  }
}
