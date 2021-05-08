import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tic_tac_toe_game/screens/home.dart';

class profilepage extends StatefulWidget {
  @override
  _profilepageState createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return _splashscreen();
  }
}

class _splashscreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      //navigateAfterSeconds: new _homescreen(),
      title: new Text(
        "Tayyaba Ishfaq\n\nFA17-BCS-115",
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      loadingText: new Text(
        "Loading...",
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      image: Image.asset(
        "assets/images/tayyaba.png",
      ),
      backgroundColor: Colors.cyan,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 60.0,
      loaderColor: Colors.white,
    );
  }
}
