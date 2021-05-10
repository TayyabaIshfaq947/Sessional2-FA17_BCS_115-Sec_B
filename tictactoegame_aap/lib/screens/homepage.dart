import 'package:flutter/material.dart';
import 'simplelevel.dart';
import 'hardlevel.dart';
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
        vertical: 10.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => simple()));
        },
        child: Material(
          color: Colors.pink,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
        vertical: 10.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => hard()));
        },
        child: Material(
          color: Colors.pink,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              "Select One Option",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          customcard(),
          customcard1()
        ],
      ),
      drawer: _myDrawer(),
    );
  }
}

class _myDrawer extends StatelessWidget {
  final Function ontap;

  _myDrawer({this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.only(left: 30),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/tayyaba.png"),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Tayyaba Ishfaq',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'taibatahira84@gmail.com',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text('Easy Level'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => simple()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text('Hard Level'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => hard()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
