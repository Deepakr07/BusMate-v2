import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:busmate/controller/dropDownController.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:busmate/model/widgets.dart';

void main() {
  runApp(BookingPage());
}

class BookingPage extends GetView<BookingController> {
  final bookingController = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Book Ticket',
                style: kBlackHeadingSize,
              ),
              const SizedBox(
                height: 75,
              ),
              Obx(() => FormHelper.dropDownWidgetWithLabel(
                    context,
                    "Route",
                    "Select Your Route",
                    controller.routeId.value,
                    controller.routes,
                    (onChangedVal) {
                      controller.routeId.value = onChangedVal;
                      print("Selected Country : $onChangedVal");
                      controller.stops.assignAll(controller.stopMaster
                          .where((stateItem) =>
                              stateItem["ParentId"].toString() ==
                              onChangedVal.toString())
                          .toList());
                      controller.stopId.value = null;
                    },
                    (onValidateVal) {
                      if (onValidateVal == null) {
                        return "Please Select a route";
                      }
                      return null;
                    },
                    borderColor: kGreenMainTheme,
                    borderFocusColor: kGreenMainTheme,
                    labelFontSize: 16,
                    borderRadius: 5,
                    paddingLeft: 0,
                    labelBold: false,
                    optionValue: "id",
                    optionLabel: "label",
                    textColor: Colors.black,
                    hintColor: kGreyTextColor,
                  )),
              SizedBox(
                height: 39,
              ),
              Obx(() => FormHelper.dropDownWidgetWithLabel(
                    context,
                    "Select Stop",
                    "Select Your Stop",
                    controller.stopId.value,
                    controller.stops,
                    (onChangedVal) {
                      controller.stopId.value = onChangedVal;
                      print("Selected Stop : $onChangedVal");
                    },
                    (onValidate) {
                      return null;
                    },
                    borderColor: kGreenMainTheme,
                    borderFocusColor: kGreenMainTheme,
                    paddingLeft: 0,
                    labelBold: false,
                    labelFontSize: 16,
                    borderRadius: 5,
                    optionValue: "ID",
                    optionLabel: "Name",
                    textColor: Colors.black,
                    hintColor: kGreyTextColor,
                  )),
              SizedBox(
                height: 39,
              ),
              Obx(() => FormHelper.dropDownWidgetWithLabel(
                    context,
                    "Select Ticket Type",
                    "Select Ticket ",
                    controller.typeId.value,
                    controller.ticketType,
                    (onChangedVal) {
                      controller.typeId.value = onChangedVal;
                      print("Selected Ticket : $onChangedVal");
                    },
                    (onValidateVal) {
                      if (onValidateVal == null) {
                        return "Please Select a Ticket";
                      }
                      return null;
                    },
                    borderColor: kGreenMainTheme,
                    borderFocusColor: kGreenMainTheme,
                    borderRadius: 5,
                    paddingLeft: 0,
                    labelBold: false,
                    labelFontSize: 16,
                    optionValue: "Id",
                    optionLabel: "Ticket",
                    textColor: Colors.black,
                    hintColor: Colors.black,
                  )),
              SizedBox(
                height: 75,
              ),
              GreenButton(),
            ],
          ),
        ),
      )),
    );
  }
}
