import 'package:get/get.dart';

class BookingController extends GetxController {
  var routes = <dynamic>[].obs;
  var stopMaster = <dynamic>[].obs;
  var stops = <dynamic>[].obs;
  var ticketType = <dynamic>[].obs;
  var stopId = Rxn<String>();
  var typeId = Rxn<String>();
  var routeId = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    ticketType.addAll([
      {"Id": 1, "Ticket": "Daily (₹10)"},
      {"Id": 2, "Ticket": "Weekly (₹30)"},
      {"Id": 3, "Ticket": "Monthly (₹80)"}
    ]);

    routes.addAll([
      {"id": 1, "label": "Aluva Route"},
      {"id": 2, "label": "Vytilla Route"}
    ]);

    stopMaster.addAll([
      {"ID": 1, "Name": "Kalamassery", "ParentId": 1},
      {"ID": 2, "Name": "Muttom", "ParentId": 1},
      {"ID": 3, "Name": "Ambattukavu", "ParentId": 1},
      {"ID": 4, "Name": "Pulinchodu", "ParentId": 1},
      {"ID": 5, "Name": "Aluva", "ParentId": 1},
      {"ID": 1, "Name": "CUSAT Junction", "ParentId": 2},
      {"ID": 2, "Name": "Kalamassery", "ParentId": 2},
      {"ID": 3, "Name": "PathadiPalam", "ParentId": 2},
      {"ID": 4, "Name": "Edappaly", "ParentId": 2},
      {"ID": 5, "Name": "Changampuzha Park", "ParentId": 2},
      {"ID": 6, "Name": "Palarivattom", "ParentId": 2},
      {"ID": 7, "Name": "Kaloor", "ParentId": 2},
      {"ID": 8, "Name": "Vytilla", "ParentId": 2},
      {"ID": 9, "Name": "Kadavanthara", "ParentId": 2},
      {"ID": 10, "Name": "Panampilly Nagar", "ParentId": 2}
    ]);
  }
}
