import 'package:flutter/material.dart';

class UserModel {
  final String uid;
  final String name;
  final String department;
  final String studentId;
  final String mobileNo;
  final String Email;

  UserModel(
      {required this.name,
      required this.department,
      required this.Email,
      required this.mobileNo,
      required this.studentId,
      required this.uid});

  toJson() {
    return {
      "Uid": uid,
      "Name": name,
      "Department": department,
      "StudentID": studentId,
      "MobileNumber": mobileNo,
      "Email": Email
    };
  }
}
