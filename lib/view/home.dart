import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: kGreenMainTheme,
          body: Column(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(24),
                height: double.infinity,
                width: double.infinity,
                color: kGreenMainTheme,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Hi, User Name',
                                      style: kWhiteHeadingSize,
                                    ),
                                    Text(
                                      '6 Jun, 2023',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFE4E4E4)),
                                    )
                                  ],
                                )),
                            Expanded(
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: kGreenMainTheme,
                                backgroundImage: Image.network(
                                        'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
                                    .image,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                'Kochi Today',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('./assets/rainy-icon.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rainy',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFE4E4E4)),
                            )
                          ],
                        )))
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35))),
                height: double.infinity,
                width: double.infinity,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
