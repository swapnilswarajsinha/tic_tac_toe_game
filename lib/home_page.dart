import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/custom_dailog.dart';
import 'package:tic_tac_toe_game/game_button.dart';

class HomePage extends StatefulWidget {
  final String player1Name;
  final String? player2Name;
  final bool multiPlayer;
  HomePage(
      {required this.player1Name,
      required this.multiPlayer,
      this.player2Name,
      Key? key})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonsList = [];
  List player1 = [];
  List player2 = [];
  int activePlayer = 1;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;

    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        activePlayer = 1;
        player2.add(gb.id);
      }

      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => CustomDialog("Game Tied",
                  "Press the reset button to start again.", resetGame));
        } else {
          !widget.multiPlayer
              ? activePlayer == 2
                  ? autoPlay()
                  : null
              : null;
        }
      }
    });
  }

  void autoPlay() {
    var emptyCells = [];
    var list = List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];

    int i = buttonsList.indexWhere((p) => p.id == cellID);

    if (buttonsList[4].text == "") {
      i = 4;
    }
    List winningList = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7],
    ];

    winningList.forEach(
      (element) {
        //for winning
        if (player2.isNotEmpty) {
          if (element.contains(player2.last)) {
            if (player2.contains(element[0]) &&
                player2.contains(element[1]) &&
                buttonsList[element[2] - 1].text == "") {
              i = element[2] - 1;
            }
            if (player2.contains(element[0]) &&
                player2.contains(element[2]) &&
                buttonsList[element[1] - 1].text == "") {
              i = element[1] - 1;
            }
            if (player2.contains(element[1]) &&
                player2.contains(element[2]) &&
                buttonsList[element[0] - 1].text == "") {
              i = element[0] - 1;
            }
          }
        }
        //for blocking
        if (element.contains(player1.last)) {
          if (player1.contains(element[0]) &&
              player1.contains(element[1]) &&
              buttonsList[element[2] - 1].text == "") {
            i = element[2] - 1;
          }
          if (player1.contains(element[0]) &&
              player1.contains(element[2]) &&
              buttonsList[element[1] - 1].text == "") {
            i = element[1] - 1;
          }
          if (player1.contains(element[1]) &&
              player1.contains(element[2]) &&
              buttonsList[element[0] - 1].text == "") {
            i = element[0] - 1;
          }
        }
      },
    );

    playGame(buttonsList[i]);
  }

  int checkWinner() {
    var winner = -1;
    //row 1
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      setState(() {
        buttonsList[0].bg = Colors.grey.shade300;
        buttonsList[1].bg = Colors.grey.shade300;
        buttonsList[2].bg = Colors.grey.shade300;
      });
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      setState(() {
        buttonsList[0].bg = Colors.grey.shade300;
        buttonsList[1].bg = Colors.grey.shade300;
        buttonsList[2].bg = Colors.grey.shade300;
      });
      winner = 2;
    }

    // row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      setState(() {
        buttonsList[3].bg = Colors.grey.shade300;
        buttonsList[4].bg = Colors.grey.shade300;
        buttonsList[5].bg = Colors.grey.shade300;
      });
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      setState(() {
        buttonsList[3].bg = Colors.grey.shade300;
        buttonsList[4].bg = Colors.grey.shade300;
        buttonsList[5].bg = Colors.grey.shade300;
      });
      winner = 2;
    }

    // row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      setState(() {
        buttonsList[6].bg = Colors.grey.shade300;
        buttonsList[7].bg = Colors.grey.shade300;
        buttonsList[8].bg = Colors.grey.shade300;
      });
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      setState(() {
        buttonsList[6].bg = Colors.grey.shade300;
        buttonsList[7].bg = Colors.grey.shade300;
        buttonsList[8].bg = Colors.grey.shade300;
      });
      winner = 2;
    }

    // col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      setState(() {
        buttonsList[0].bg = Colors.grey.shade300;
        buttonsList[3].bg = Colors.grey.shade300;
        buttonsList[6].bg = Colors.grey.shade300;
      });
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      setState(() {
        buttonsList[0].bg = Colors.grey.shade300;
        buttonsList[3].bg = Colors.grey.shade300;
        buttonsList[6].bg = Colors.grey.shade300;
      });
      winner = 2;
    }

    // col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      setState(() {
        buttonsList[1].bg = Colors.grey.shade300;
        buttonsList[4].bg = Colors.grey.shade300;
        buttonsList[7].bg = Colors.grey.shade300;
      });
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      setState(() {
        buttonsList[1].bg = Colors.grey.shade300;
        buttonsList[4].bg = Colors.grey.shade300;
        buttonsList[7].bg = Colors.grey.shade300;
      });
      winner = 2;
    }

    // col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      setState(() {
        buttonsList[2].bg = Colors.grey.shade300;
        buttonsList[5].bg = Colors.grey.shade300;
        buttonsList[8].bg = Colors.grey.shade300;
      });
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      setState(() {
        buttonsList[2].bg = Colors.grey.shade300;
        buttonsList[5].bg = Colors.grey.shade300;
        buttonsList[8].bg = Colors.grey.shade300;
      });
      winner = 2;
    }

    //diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      setState(() {
        buttonsList[0].bg = Colors.grey.shade300;
        buttonsList[4].bg = Colors.grey.shade300;
        buttonsList[8].bg = Colors.grey.shade300;
      });
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      setState(() {
        buttonsList[0].bg = Colors.grey.shade300;
        buttonsList[4].bg = Colors.grey.shade300;
        buttonsList[8].bg = Colors.grey.shade300;
      });
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      setState(() {
        buttonsList[2].bg = Colors.grey.shade300;
        buttonsList[4].bg = Colors.grey.shade300;
        buttonsList[6].bg = Colors.grey.shade300;
      });
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      setState(() {
        buttonsList[2].bg = Colors.grey.shade300;
        buttonsList[4].bg = Colors.grey.shade300;
        buttonsList[6].bg = Colors.grey.shade300;
      });
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => CustomDialog("${widget.player1Name} won the game",
                "Press the reset button to start again.", resetGame));
      } else {
        String? player2Name;
        if (widget.player2Name == null) {
          player2Name = "Ultron (AI)";
        } else {
          player2Name = widget.player2Name;
        }
        showDialog(
            context: context,
            builder: (_) => CustomDialog("$player2Name won the game",
                "Press the reset button to start again.", resetGame));
      }
    }

    return winner;
  }

  void resetGame() {
    setState(() {
      buttonsList = doInit();
    });
    Navigator.of(context).pop();
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Exit Game',
              style: GoogleFonts.bebasNeue(),
            ),
            content: Text(
              'Do you want to exit the game?',
              style: GoogleFonts.bebasNeue(),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  'Yes',
                  style: GoogleFonts.bebasNeue(),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: GoogleFonts.bebasNeue(),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            foregroundColor: Colors.black,
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/Images/logo.png",
                  height: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Tic Tac Toe",
                  style: GoogleFonts.roboto(
                      fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 350,
                      width: 350,
                      color: Colors.black87,
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0),
                      itemCount: buttonsList.length,
                      itemBuilder: (context, i) => SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(buttonsList[i].bg),
                              elevation: MaterialStateProperty.all(0)),
                          onPressed: buttonsList[i].enabled
                              ? () => playGame(buttonsList[i])
                              : null,
                          child: Icon(
                            (buttonsList[i].text == "X")
                                ? Icons.close_rounded
                                : (buttonsList[i].text == "0")
                                    ? Icons.radio_button_off_rounded
                                    : null,
                            size: 70,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    buttonsList = doInit();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.refresh_rounded,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Double tap here to reset the game.",
                          style: GoogleFonts.bebasNeue(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
