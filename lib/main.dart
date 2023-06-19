import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:busmate/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:busmate/services/auth_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const BusMate());
}

class BusMate extends StatelessWidget {
  const BusMate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //initialRoute: AppRoutes.starting, // Set the initial route
        getPages: AppRoutes.routes,
        home: AuthService().HandleAuthState());
  }
}
