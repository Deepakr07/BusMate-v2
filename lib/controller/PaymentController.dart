import 'package:busmate/model/StoringTicketModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:busmate/view/ticketConfirmation.dart';
import 'package:busmate/controller/storeTicketController.dart';
import 'package:busmate/model/StoringTicketModel.dart';

final TicketRepo = Get.put(storeTicketController());

Future<void> CreateTicket(TicketStoreModel Ticket) async {
  await TicketRepo.createTicket(Ticket);
}

class paymentController extends GetxController {
  static var client = http.Client();
  var _razorpay = Razorpay();
  var StopZ;
  var RouteZ;
  var TicketTypeZ;
  var amountZ;
  var issueDateZ;
  var expiryDateZ;
  late String? userUid;
  late int countZ;
  var imageUrlZ;

  @override
  void onInit() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  Future<void> getImageFromAPI(String docId) async {
    var response = await client.get(
      Uri.parse(
          'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=$docId'),
    );

    if (response.statusCode == 200) {
      final String currentTime =
          DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      final String imageName = 'image_$currentTime.jpg';
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('QRimages/$imageName');

      // Save the image to Cloud Storage with the formatted name
      await storageRef.putData(response.bodyBytes);

      // Get the URL of the stored image
      final imageUrl = await storageRef.getDownloadURL();

      // Update the URL in Firebase Firestore
      await FirebaseFirestore.instance
          .collection('Tickets')
          .doc(docId)
          .update({'ImageUrl': imageUrl});

      // Retrieve the stored data from the Firestore document
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Tickets')
          .doc(docId)
          .get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        // Access and use the retrieved data as per your requirement
        final String destination = data['Destination'];
        final String route = data['Route'];
        final int count = data['count'];
        final String expiryDate = data['ExpiryDate'];
        final String issueDate = data['IssueDate'];
        final String imageData = imageUrl;
        Get.to(() => TicketConfirmation(), arguments: {
          'destination': destination,
          'route': route,
          'count': count,
          'expiryDate': expiryDate,
          'issueDate': issueDate,
          'image': imageData,
          'ticketId': docId,
        });
      } else {
        // Handle document not found
        print('Document does not exist');
      }

      // Display success message or perform any other actions
      print('Image stored, URL updated, and data retrieved successfully');
    } else {
      // Handle API error
      print('Failed to retrieve the image from the API');
    }
  }

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

  void computeTicketDetails(var stop, var route, var ticketType, var amount,
      var issue, var expiry, int count) {
    StopZ = stop;
    RouteZ = route;
    TicketTypeZ = ticketType;
    amountZ = amount;
    issueDateZ = issue;
    expiryDateZ = expiry;
    countZ = count;
    getUserUid();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Successful");
    final ticket = TicketStoreModel(
        Stop: StopZ,
        Route: RouteZ,
        TicketType: TicketTypeZ,
        issueDate: issueDateZ,
        expiryDate: expiryDateZ,
        count: countZ,
        userUid: userUid);
    CreateTicket(ticket);

    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("payment Failed");
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  void startPayment(int amount) {
    var options = {
      'key': 'rzp_test_g28COtTM5gAxmz',
      'amount': amount * 100, // Convert amount to paise
      'name': 'BusMate',
      'timeout': 300,
      'description': 'Test payment',
      'prefill': {
        'contact': '8888888888',
        'email': 'areffects@gmail.com',
      },
    };
    _razorpay.open(options);
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }
}
