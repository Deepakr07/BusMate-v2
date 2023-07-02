import 'package:get/get.dart';

class ConfirmSelectionController extends GetxController {
  var isLoading = false.obs;

  void toggleLoading(bool value) {
    isLoading.value = value;
  }
}
