import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static var route = "/Secend_Screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.menu_book_outlined,
              size: 125,
              color: Colors.blue,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'ibook App',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
