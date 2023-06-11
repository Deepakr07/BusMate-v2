import 'package:busmate/model/Tickets_model.dart';

import '../model/Tickets_list.dart';
import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';

void main() {
  runApp(const History());
}

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'History',
                    style: kBlackHeadingSize,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: tickets.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ticket = tickets[index];
                      return SizedBox(
                        width: 300,
                        height: 200,
                        child: ticket,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
