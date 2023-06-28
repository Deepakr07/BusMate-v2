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

  String getSelectedTicket() {
    int? selectedIndex =
        typeId.value != null ? int.tryParse(typeId.value!) : -1;
    if (selectedIndex! - 1 >= 0 && selectedIndex - 1 < ticketType.length) {
      return ticketType[selectedIndex - 1]['Ticket'];
    }
    return '';
  }

  String getSelectedRouteName() {
    int selectedIndex =
        routeId.value != null ? int.tryParse(routeId.value!) ?? -1 : -1;
    if (selectedIndex - 1 >= 0 && selectedIndex - 1 < routes.length) {
      return routes[selectedIndex - 1]['label'];
    }
    return '';
  }

  String getSelectedStopName() {
    if (stopId.value != null && routeId.value != null) {
      int? selectedStopId = int.tryParse(stopId.value!);
      int? selectedRouteId = int.tryParse(routeId.value!);

      var selectedStops = stopMaster.where((stop) {
        return stop['ParentId'] == selectedRouteId;
      }).toList();

      var selectedStop = selectedStops.firstWhere(
        (stop) => stop['ID'] == selectedStopId,
        orElse: () => null,
      );

      if (selectedStop != null) {
        return selectedStop['Name'];
      }
    }

    return '';
  }
}
