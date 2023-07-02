import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:busmate/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:busmate/services/auth_service.dart';
import 'package:busmate/controller/bottomNavBarController.dart';
import 'package:busmate/controller/confirmSelectionController.dart';
//imports

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(BusMate());
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
      initialBinding: InitialBindings(),
    );
  }
}
