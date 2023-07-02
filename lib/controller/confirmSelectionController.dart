import 'package:get/get.dart';

class ConfirmSelectionController extends GetxController {
  var isLoading = false.obs;

  void toggleLoading(bool value) {
    isLoading.value = value;
  }
}

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ConfirmSelectionController());
  }
}
