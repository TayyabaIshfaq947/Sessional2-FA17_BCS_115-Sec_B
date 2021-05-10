import 'dart:math';
import 'dart:ui';
import 'dart:async';
import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:tic_tac_toe_game/screens/simplelevel.dart';
import '../flutter_icon_home.dart';
import 'game_button.dart';
import 'homepage.dart';
import 'dart:async';

class hard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: gamepage(),
    );
  }
}

class gamepage extends StatefulWidget {
  @override
  _gamepageState createState() => _gamepageState();
}

class _gamepageState extends State<gamepage> {
  List<GameButton> buttonlist;
  var player1;
  var player2;
  var activeplayer;
  int limit = 5;
  @override
  void initState() {
    super.initState();
    buttonlist = doInit();
  }

  List<GameButton> doInit() {
    activeplayer = 1;
    player1 = new List.empty(growable: true);
    player2 = new List.empty(growable: true);
    var gamebuttons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
      new GameButton(id: 10),
      new GameButton(id: 11),
      new GameButton(id: 12),
      new GameButton(id: 13),
      new GameButton(id: 14),
      new GameButton(id: 15),
      new GameButton(id: 16),
    ];
    return gamebuttons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activeplayer == 1) {
        gb.text = "X";
        gb.bg = Colors.pinkAccent;
        activeplayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        gb.bg = Colors.cyan;
        activeplayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonlist.every((p) => p.text != "")) {
          showDialog(
            context: context,
            builder: (_) => NetworkGiffyDialog(
              buttonCancelColor: Colors.teal,
              buttonCancelText: Text("Ok"),
              image: Image.asset('assets/images/tie.gif'),
              title: Text(
                "Game Tie",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
              onlyCancelButton: true,
              entryAnimation: EntryAnimation.TOP_RIGHT,
              cornerRadius: 8.0,
            ),
          );
        } else {
          activeplayer == 2 ? autoplay() : null;
        }
      }
    });
  }

  void autoplay() {
    var emptyCells = new List.empty(growable: true);
    var list = new List.generate(12, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }
    var r = new Random();
    var randindex = r.nextInt(emptyCells.length - 1);
    var cellId = emptyCells[randindex];
    int i = buttonlist.indexWhere((p) => p.id == cellId);
    playGame(buttonlist[i]);
  }

  int checkWinner() {
    var winner = -1;
    //row1
    if (player1.contains(1) &&
        player1.contains(2) &&
        player1.contains(3) &&
        player1.contains(4)) {
      winner = 1;
    }
    if (player2.contains(1) &&
        player2.contains(2) &&
        player2.contains(3) &&
        player2.contains(4)) {
      winner = 2;
    }
    //row2
    if (player1.contains(5) &&
        player1.contains(6) &&
        player1.contains(7) &&
        player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(5) &&
        player2.contains(6) &&
        player2.contains(7) &&
        player2.contains(8)) {
      winner = 2;
    }
    //row 3
    if (player1.contains(9) &&
        player1.contains(10) &&
        player1.contains(11) &&
        player1.contains(12)) {
      winner = 1;
    }
    if (player2.contains(9) &&
        player2.contains(10) &&
        player2.contains(11) &&
        player2.contains(12)) {
      winner = 2;
    }
    // row 4
    if (player1.contains(13) &&
        player1.contains(14) &&
        player1.contains(15) &&
        player1.contains(16)) {
      winner = 1;
    }
    if (player2.contains(13) &&
        player2.contains(14) &&
        player2.contains(15) &&
        player2.contains(16)) {
      winner = 2;
    }
    //column1
    if (player1.contains(1) &&
        player1.contains(5) &&
        player1.contains(9) &&
        player1.contains(13)) {
      winner = 1;
    }
    if (player2.contains(1) &&
        player2.contains(5) &&
        player2.contains(9) &&
        player2.contains(13)) {
      winner = 2;
    }
    //column2
    if (player1.contains(2) &&
        player1.contains(6) &&
        player1.contains(10) &&
        player1.contains(14)) {
      winner = 1;
    }
    if (player2.contains(2) &&
        player2.contains(6) &&
        player2.contains(10) &&
        player2.contains(14)) {
      winner = 2;
    }
    //column 3
    if (player1.contains(3) &&
        player1.contains(7) &&
        player1.contains(11) &&
        player1.contains(15)) {
      winner = 1;
    }
    if (player2.contains(3) &&
        player2.contains(7) &&
        player2.contains(11) &&
        player2.contains(15)) {
      winner = 2;
    }
    //column 4
    if (player1.contains(4) &&
        player1.contains(8) &&
        player1.contains(12) &&
        player1.contains(16)) {
      winner = 1;
    }
    if (player2.contains(4) &&
        player2.contains(8) &&
        player2.contains(12) &&
        player2.contains(16)) {
      winner = 2;
    }
    //diagonal1
    if (player1.contains(1) &&
        player1.contains(6) &&
        player1.contains(11) &&
        player1.contains(16)) {
      winner = 1;
    }
    if (player2.contains(1) &&
        player2.contains(6) &&
        player2.contains(11) &&
        player2.contains(16)) {
      winner = 2;
    }
    // diagonal2
    if (player1.contains(4) &&
        player1.contains(7) &&
        player1.contains(10) &&
        player1.contains(13)) {
      winner = 1;
    }
    if (player2.contains(4) &&
        player2.contains(7) &&
        player2.contains(10) &&
        player2.contains(13)) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
          context: context,
          builder: (_) => NetworkGiffyDialog(
            buttonCancelColor: Colors.teal,
            buttonCancelText: Text("Ok"),
            image: Image.asset('assets/images/congrats.gif'),
            title: Text(
              "Player 1 won",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            onlyCancelButton: true,
            entryAnimation: EntryAnimation.TOP_LEFT,
            cornerRadius: 8.0,
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => NetworkGiffyDialog(
            buttonCancelColor: Colors.teal,
            buttonCancelText: Text("Ok"),
            image: Image.asset('assets/images/congrats.gif'),
            title: Text(
              "Player 2 won",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            onlyCancelButton: true,
            entryAnimation: EntryAnimation.BOTTOM_LEFT,
            cornerRadius: 8.0,
          ),
        );
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonlist = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.cyan,
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: Center(
              child: Text(
                "Tic Tac Toe",
                style: TextStyle(
                  color: Colors.white,
                ),
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
          body: Container(
            height: 1000,
            width: 1000,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Hard Level",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    padding: EdgeInsets.fromLTRB(20, 6.0, 20, 10),
                    child: Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1.0,
                          mainAxisSpacing: 5.0,
                          crossAxisSpacing: 5.0,
                        ),
                        padding: EdgeInsets.all(8.0),
                        itemCount: buttonlist.length,
                        itemBuilder: (context, i) => SizedBox(
                          height: 100.0,
                          width: 100.0,
                          child: RaisedButton(
                            padding: EdgeInsets.all(5.0),
                            onPressed: buttonlist[i].enabled
                                ? () => playGame(buttonlist[i])
                                : null,
                            child: Text(
                              buttonlist[i].text,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            color: buttonlist[i].bg,
                            disabledColor: buttonlist[i].bg,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: resetGame,
                  child: Text(
                    "Reset",
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  color: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.all(10.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => selecttype()));
                    });
                  },
                  child: Text(
                    "Quit",
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.all(8.0),
                )
              ],
            ),
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

