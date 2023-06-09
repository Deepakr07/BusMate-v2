import 'package:get/get.dart';
import 'package:busmate/model/ticker_model.dart';

class TicketController extends GetxController {
  var tickets = <Ticket>[].obs;

  @override
  void onInit() {
    fetchTickets();
  }

  void fetchTickets() {}
}
