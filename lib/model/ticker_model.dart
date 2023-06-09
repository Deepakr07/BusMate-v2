import 'package:flutter/cupertino.dart';

class Ticket {
  late final int ticketId;
  late final String route;
  String college = 'SOE';
  late final String destination;
  late final DateTime issueDate;
  late final DateTime expiryDate;
  late final ImageProvider qrImage;
  late final String ticketType; //monthly,weekly,daily

  Ticket(
      {required this.destination,
      required this.route,
      required this.ticketType}) {}
}
