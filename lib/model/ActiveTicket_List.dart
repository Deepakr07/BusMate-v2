import '../model/ActiveTicket_model.dart';

//the tickets present inside this list is show in the active ticket region

List<activeTicket> activeTickets = [];

List<activeTicket> emptyActiveTickets = [
  activeTicket(
      ticketId: 'No active Tickets ',
      route: 'NIL',
      destination: 'NIL',
      issueDate: 'NIL',
      expiryDate: 'NIL')
];
