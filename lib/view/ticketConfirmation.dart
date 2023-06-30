import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/model/ActiveTicket_model.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:busmate/view/home.dart';
import 'package:busmate/controller/bottomNavBarController.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  runApp(TicketConfirmation());
}

class TicketConfirmation extends StatelessWidget {
  final BottomNavBarController _controller = Get.find();

  Future<void> getPdfTicket() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          ); // Center
        }));
    await Printing.layoutPdf(onLayout: (PdfPageFormat) async => pdf.save());
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
                    onTap: () => {getPdfTicket()},
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
