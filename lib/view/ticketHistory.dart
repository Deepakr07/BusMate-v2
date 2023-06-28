import 'package:busmate/model/Tickets_model.dart';
import 'package:busmate/model/Bottomnav_model4.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:intl/intl.dart';

class History extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;

  String? userUid;
  void getUserUid() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userUid = user.uid;
      print("UID : " + userUid!);
    } else {
      // Handle the case when the user is not logged in
      // You can set userUid to null or handle the situation accordingly
      userUid = null;
    }
  }

  bool isDateExpired(String dateString) {
    final currentDate = DateTime.now();
    final dateFormat = DateFormat('dd-MMM-yy');
    final parsedDate = dateFormat.parse(dateString);
    final dateToCompare =
        DateTime(parsedDate.year, parsedDate.month, parsedDate.day);

    return dateToCompare.isBefore(currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavBar(),
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.all(24),
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
                  child: StreamBuilder(
                    stream: _firestore.collection('Tickets').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: kGreenMainTheme,
                          ),
                        );
                      }
                      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
                          snapshot.data!;
                      List<QueryDocumentSnapshot<Map<String, dynamic>>>
                          tickets = querySnapshot.docs;
                      List<Widget> ticketWidgets = [];
                      getUserUid();
                      for (var ticket in tickets) {
                        final expiryDate = ticket.data()['ExpiryDate'];
                        bool status = isDateExpired(expiryDate);
                        String ticketStatus = status ? "Expired" : "Active";
                        final uid = ticket.data()['Uid'];

                        if (uid == userUid) {
                          final destination = ticket.data()['Destination'];
                          final issueDate = ticket.data()['IssueDate'];
                          final count = ticket.data()['count'];
                          final route = ticket.data()['Route'];
                          final ticketType = ticket.data()['TicketType'];
                          final id = ticket.id;
                          final image = ticket.data()['ImageUrl'];

                          ticketWidgets.add(allTickets(
                            ticketId: id,
                            route: route,
                            destination: destination,
                            issueDate: issueDate,
                            status: ticketStatus,
                            qrImage: image,
                          ));
                        }
                      }
                      return ListView.builder(
                        itemCount: ticketWidgets.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 300,
                            height: 180,
                            child: ticketWidgets[index],
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
