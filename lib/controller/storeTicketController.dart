import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:busmate/model/StoringTicketModel.dart';

class storeTicketController extends GetxController {
  static storeTicketController get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createTicket(TicketStoreModel user) async {
    try {
      var documentRef = await _db.collection('Tickets').add(user.toJson());
      String DocumentId = documentRef.id;
      // Use the variable Did for further processing if needed
      print("Document ID: $DocumentId");
      // Perform any other actions with the document ID
    } catch (error, stackTrace) {
      print("Error: $error");
      print("Stacktrace: $stackTrace");
      // Handle the error as needed
    }
  }
}
