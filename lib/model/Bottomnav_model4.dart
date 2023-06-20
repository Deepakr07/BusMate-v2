import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:busmate/routes/routes.dart';
import 'package:busmate/controller/bottomnabarcontroller.dart';
import 'package:busmate/Constants/constants.dart';
//bottom navbar

class BottomNavBar extends StatelessWidget {
  final BottomNavBarController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _controller.currentIndex.value,
        onTap: (index) {
          _controller.changePage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _controller.currentIndex.value == 0
                  ? kGreenMainTheme
                  : kGreenMainTheme.withOpacity(0.4),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.padding_outlined,
              color: _controller.currentIndex.value == 1
                  ? kGreenMainTheme
                  : kGreenMainTheme.withOpacity(0.4),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: _controller.currentIndex.value == 2
                  ? kGreenMainTheme
                  : kGreenMainTheme.withOpacity(0.4),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              color: _controller.currentIndex.value == 3
                  ? kGreenMainTheme
                  : kGreenMainTheme.withOpacity(0.4),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
