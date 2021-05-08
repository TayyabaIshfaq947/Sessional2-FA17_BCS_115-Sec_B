import 'package:flutter/material.dart';
import 'simplelevel.dart';
import 'hardlevel.dart';
import 'package:tic_tac_toe_game/ContacUs.dart';
import 'package:contactus/contactus.dart';
import 'package:tic_tac_toe_game/flutter_icon_home.dart';

class selecttype extends StatefulWidget {
  @override
  _selecttypeState createState() => _selecttypeState();
}

class _selecttypeState extends State<selecttype> {
  Widget customcard() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => simple()));
        },
        child: Material(
          color: Colors.orange,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'Easy level',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customcard1() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => hard()));
        },
        child: Material(
          color: Colors.orange,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'Hard Level',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Level Options",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(MyFlutterApp.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => selecttype()));
              }),
          IconButton(
            icon: const Icon(Icons.contact_phone_outlined),
            tooltip: 'ContactUs',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUs()));
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[customcard(), customcard1()],
      ),
      drawer: _myDrawer(),
    );
  }
}
