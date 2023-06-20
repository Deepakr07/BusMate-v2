import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:busmate/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:busmate/services/auth_service.dart';
import 'package:busmate/controller/bottomnabarcontroller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(BusMate());
}

class BusMate extends StatelessWidget {
  final BottomNavBarController _controller = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //initialRoute: AppRoutes.starting, // Set the initial route
        getPages: AppRoutes.routes,
        home: AuthService().HandleAuthState());
  }
}
