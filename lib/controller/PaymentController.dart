import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:busmate/view/ticketConfirmation.dart';

class paymentController extends GetxController {
  var _razorpay = Razorpay();
  @override
  void onInit() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Successful");
    Get.to(() => TicketConfirmation());
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
