class TicketStoreModel {
  var Stop;
  var Route;
  var TicketType;
  var issueDate;
  var expiryDate;
  late String? userUid;
  late int count;
  var imageUrl = "Image Url";

  TicketStoreModel({
    required this.Stop,
    required this.Route,
    required this.TicketType,
    required this.issueDate,
    required this.expiryDate,
    required this.count,
    required this.userUid,
  });

  toJson() {
    return {
      "Uid": userUid,
      "Destination": Stop,
      "ExpiryDate": expiryDate,
      "IssueDate": issueDate,
      "Route": Route,
      "TicketType": TicketType,
      "count": count,
      "ImageUrl": imageUrl
    };
  }
}
