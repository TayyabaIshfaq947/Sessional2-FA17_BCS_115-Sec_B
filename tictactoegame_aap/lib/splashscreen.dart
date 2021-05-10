import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'profile.dart';

class splashscreen extends StatefulWidget {
  splashscreen({
    Key key,
  }) : super(key: key);
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  // ignore: must_call_super
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => profilepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Center(
              child: Text(
            'Tic Tac Toe',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: Lottie.asset('assets/images/data.json'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
