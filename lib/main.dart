import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:busmate/routes/routes.dart';

void main() {
  runApp(const BusMate());
}

class BusMate extends StatelessWidget {
  const BusMate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.starting, // Set the initial route
      getPages: AppRoutes.routes,
    );
  }
}
