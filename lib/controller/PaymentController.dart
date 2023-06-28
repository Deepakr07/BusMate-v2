import 'package:busmate/model/StoringTicketModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:busmate/view/ticketConfirmation.dart';
import 'package:busmate/controller/storeTicketController.dart';
import 'package:busmate/model/StoringTicketModel.dart';

final TicketRepo = Get.put(storeTicketController());

Future<void> CreateTicket(TicketStoreModel Ticket) async {
  await TicketRepo.createTicket(Ticket);
}

class paymentController extends GetxController {
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
    //Get.to(() => TicketConfirmation());
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
