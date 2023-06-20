import 'package:get/get.dart';
import 'package:busmate/routes/routes.dart';
import 'package:busmate/view/home.dart';

class BottomNavBarController extends GetxController {
  var currentIndex = 0.obs;
  void changePage(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.off(() => HomePage(),
            transition: Transition.downToUp,
            duration: Duration(microseconds: 0));
        break;
      case 1:
        Get.offNamed(
          AppRoutes.booking,
        );
        break;
      case 2:
        Get.offNamed(AppRoutes.history);
        break;
      case 3:
        Get.offNamed(AppRoutes.editProfile);
        break;
    }
  }
}
