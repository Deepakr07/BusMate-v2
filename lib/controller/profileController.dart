import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:busmate/controller/UserProfileController.dart';
import '';

class profileController extends GetxController {
  static profileController get instance => Get.find();
  final UserRepo = Get.put(UserProfileController());
  var Uid;

  getUserData() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      Uid = currentUser.uid;
      return UserRepo.getUserDetails(Uid);
    } else {
      Get.snackbar("Error", "login to continue");
    }
  }
}
