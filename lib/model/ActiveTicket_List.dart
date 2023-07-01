import '../model/ActiveTicket_model.dart';

//the tickets present inside this list is show in the active ticket region

List<activeTicket> activeTickets = [];

List<activeTicket> emptyActiveTickets = [
  activeTicket(
    ticketId: 'No active Tickets ',
    route: 'NIL',
    destination: 'NIL',
    issueDate: 'NIL',
    expiryDate: 'NIL',
    qrImage:
        'https://cutewallpaper.org/24/qr-code-png/qr-05bcf-code-6056e-png.png',
    rides: 0,
  )
];
