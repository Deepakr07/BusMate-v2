import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:busmate/model/userModel.dart';

class UserProfileController extends GetxController {
  static UserProfileController get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection('users')
        .add(user.toJson())
        .whenComplete(
            () => Get.snackbar("Success", "Profile has been created."))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong,Try Again");
    });
  }
}
