import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/model/ActiveTicket_model.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:busmate/view/home.dart';
import 'package:busmate/controller/bottomNavBarController.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(TicketConfirmation());
}

class TicketConfirmation extends StatelessWidget {
  final BottomNavBarController _controller = Get.find();
  final GlobalKey<State<StatefulWidget>> screenshotKey =
      GlobalKey<State<StatefulWidget>>();

  Future<String> saveImageToGallery(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }

  Future<Uint8List?> captureScreenshot() async {
    RenderRepaintBoundary? boundary = screenshotKey.currentContext
        ?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary != null) {
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    }
    return null;
  }

  void navigateToHome() {
    _controller.changePage(0);
    Get.offAll(() => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;
    var stop = arguments['Destination'];
    var route = arguments['Route'];
    var expiryDate = arguments['ExpiryDate'];
    var issueDate = arguments['IssueDate'];
    var ticketID = arguments['TicketID'];
    var imageUrl = arguments['Image'];
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Confirmation",
              style: kBlackHeadingSize,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Your Ticket",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: RepaintBoundary(
                key: screenshotKey,
                child: SizedBox(
                  height: 180,
                  child: activeTicket(
                    destination: stop,
                    route: route,
                    expiryDate: expiryDate,
                    issueDate: issueDate,
                    ticketId: ticketID,
                    qrImage: imageUrl,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Ticket Generated at: ${DateFormat('hh:mm a').format(DateTime.now())}',
              style: const TextStyle(color: kGreyTextColor, fontSize: 16),
            ),
            const SizedBox(
              height: 65,
            ),
            Row(
              children: [
                Expanded(
                  child: borderbutton(
                    text: 'Home',
                    onTap: navigateToHome,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: ElevatedGreenButton(
                    text: 'Download',
                    onTap: () async {
                      final Uint8List? imageBytes = await captureScreenshot();
                      if (imageBytes != null) {
                        final filePath = await saveImageToGallery(imageBytes);
                        Get.snackbar(
                          'Success',
                          'Your Ticket Has been saved successfully',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 3),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
