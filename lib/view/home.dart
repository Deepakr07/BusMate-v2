import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        body: Column(
          children: [
            Expanded(
                child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.redAccent,
              child: Column(
                children: [
                  Row(
                    children: [],
                  )
                ],
              ),
            )),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35))),
              height: double.infinity,
              width: double.infinity,
            ))
          ],
        ),
      ),
    );
  }
}
