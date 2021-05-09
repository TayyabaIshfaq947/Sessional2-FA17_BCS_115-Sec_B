import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/flutter_icon_home.dart';
import 'package:tic_tac_toe_game/screens/game_button.dart';
import 'homepage.dart';
import 'package:contactus/contactus.dart';

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
      checkWinner();
    });
  }

  void checkWinner() {
    var winner = -1;
    //row1
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
    // diagonal2
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
      } else {}
    }
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
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 6.0, 20, 10),
          height: 300.0,
          width: 300.0,
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
    );
  }
}
