import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/Constants/constants.dart';

void main() {
  runApp(CreateProfile());
}

class CreateProfile extends StatelessWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Profile",
                style: kBlackHeadingSize,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: Image.network(
                            "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
                        .image,
                    radius: 40,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "User Name",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 29,
              ),
              Text("Full Name"),
            ],
          ),
        ),
      ),
    );
  }
}
