import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/flutter_icon_home.dart';
import 'package:tic_tac_toe_game/screens/dialog.dart';
import 'package:tic_tac_toe_game/screens/game_button.dart';
import 'homepage.dart';
import 'package:contactus/contactus.dart';
import 'hardlevel.dart';

class simple extends StatelessWidget {
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
  int player1count = 0;
  int player2count = 0;
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
              builder: (_) => customDialog(
                  resetGame, "Game Tie", "To start Again click Ok"));
        } else {
          activeplayer == 2 ? autoplay() : null;
        }
      }
    });
  }

  void autoplay() {
    var emptyCells = new List.empty(growable: true);
    var list = new List.generate(9, (i) => i + 1);
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
    if (player1count < limit && player2count < limit) {
      if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
        winner = 1;
      }
      if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
        winner = 2;
      }
      //row2
      if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
        winner = 1;
      }
      if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
        winner = 2;
      }
      //row 3
      if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
        winner = 1;
      }
      if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
        winner = 2;
      }
      //column1
      if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
        winner = 1;
      }
      if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
        winner = 2;
      }
      //column2
      if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
        winner = 1;
      }
      if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
        winner = 2;
      }
      //column 3
      if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
        winner = 1;
      }
      if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
        winner = 2;
      }
      //diagonal1
      if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
        winner = 1;
      }
      if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
        winner = 2;
      }
      // diagonal 2
      if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
        winner = 1;
      }
      if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
        winner = 2;
      }
      if (winner != -1) {
        if (winner == 1) {
          showDialog(
              context: context,
              builder: (_) => customDialog(
                  resetGame, "Player 1 Won", "To start Again click Ok"));
        } else {
          showDialog(
              context: context,
              builder: (_) => customDialog(
                  resetGame, "Player 2 Won", "To start Again click Ok"));
        }
      }
      return winner;
    }
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
        height: 900,
        width: 900,
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Easy Level",
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
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                    ),
                    padding: EdgeInsets.all(8.0),
                    itemCount: buttonlist.length,
                    itemBuilder: (context, i) => SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: RaisedButton(
                        padding: EdgeInsets.all(5.0),
                        onPressed: buttonlist[i].enabled
                            ? () => playGame(buttonlist[i])
                            : null,
                        child: Text(
                          buttonlist[i].text,
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
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
                      color: Colors.blue, width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.all(10.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => selecttype()));
                });
              },
              child: Text(
                "Quit",
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.blue, width: 1, style: BorderStyle.solid),
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
