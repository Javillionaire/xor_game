import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iks_zero_game/widgets/score_player.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool? isTheme = true;
  List<int> listBox = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  bool? turnOf = true;
  int? scoreX = 0;
  int? scoreO = 0;
  int? filledBoxes = 0;
  final List<String> xOrOList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isTheme! ? Colors.black : Colors.white,
      appBar: AppBar(
          leading: IconButton(
              color: isTheme! ? Colors.white : Colors.black,
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text(
                          "Choose your destiny",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'SFPro'),
                        ),
                        content: Container(
                          alignment: Alignment.center,
                          child: RichText(
                              text: const TextSpan(
                                  text: 'X',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SFPro'),
                                  children: [
                                TextSpan(
                                  text: ' or ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SFPro'),
                                ),
                                TextSpan(
                                  text: 'O',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SFPro'),
                                )
                              ])),
                        ),
                        actions: [
                          CupertinoDialogAction(
                              child: const Text(
                                'X',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'SFPro'),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  turnOf = true;
                                });
                              }),
                          CupertinoDialogAction(
                              child: const Text(
                                'O',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'SFPro'),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  turnOf = false;
                                });
                              })
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.select_all_outlined)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: .0,
          title: RichText(
              text: TextSpan(
                  text: 'X',
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFPro'),
                  children: [
                TextSpan(
                  text: ' or ',
                  style: TextStyle(
                      color: isTheme! ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFPro'),
                ),
                const TextSpan(
                  text: 'O',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SFPro'),
                )
              ])),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isTheme = !isTheme!;
                  });
                },
                icon: isTheme == false
                    ? const Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                      )
                    : const Icon(
                        Icons.nights_stay,
                        color: Colors.grey,
                      )),
            PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: isTheme! ? Colors.white : Colors.black,
                ),
                color: isTheme! ? Colors.black : Colors.white,
                itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        child: Text(
                          'Clear board',
                          style: TextStyle(
                              color: isTheme! ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        onTap: () {
                          _clearBoard();
                        },
                      ),
                      PopupMenuItem(
                        child: Text(
                          'Clear score',
                          style: TextStyle(
                              color: isTheme! ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        onTap: () {
                          setState(() {
                            scoreO = 0;
                            scoreX = 0;
                          });
                        },
                      )
                    ])
          ]),
      body: Column(
        children: [

          playerScore(),
          const SizedBox(
            height: 30,
          ),
          gridView(),
          const SizedBox(
            height: 20,
          ),
          turnPlayer(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget playerScore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Player(
                isTheme: isTheme,
                player: ' X ',
                color: Colors.red,
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Score: ',
                      style: TextStyle(
                          color: isTheme! ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SFPro'),
                      children: [
                    TextSpan(
                      text: scoreX.toString(),
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SFPro'),
                    )
                  ])),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Player(
                isTheme: isTheme,
                player: ' O ',
                color: Colors.green,
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Score: ',
                      style: TextStyle(
                          color: isTheme! ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SFPro'),
                      children: [
                    TextSpan(
                      text: scoreO.toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SFPro'),
                    )
                  ])),
            ],
          ),
        )
      ],
    );
  }

  Widget turnPlayer() {
    return Container(
        alignment: Alignment.center,
        height: 60,
        width: 250,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: turnOf == true ? Colors.red : Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        child: RichText(
            text: TextSpan(
                children: [
              TextSpan(
                  text: turnOf == true ? 'X' : 'O',
                  style: TextStyle(
                      color: turnOf! ? Colors.red : Colors.green,
                      fontFamily: 'SFPro',
                      fontWeight: FontWeight.w500))
            ],
                text: 'Turn of ',
                style: TextStyle(
                    color: isTheme! ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFPro',
                    fontSize: 20))));
  }

  Widget gridView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: listBox[index] == 0
                    ? () {
                        tapped(index);
                      }
                    : () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                    child: Text(
                      xOrOList[index],
                      style: TextStyle(
                          fontFamily: 'SWild',
                          fontSize: 60,
                          fontWeight: FontWeight.w500,
                          color: xOrOList[index] == 'X'
                              ? Colors.red
                              : Colors.green),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (turnOf! && xOrOList[index] == '') {
        xOrOList[index] = 'X';
        filledBoxes = filledBoxes! + 1;
        listBox[index] = 1;
      } else if (!turnOf! && xOrOList[index] == '') {
        xOrOList[index] = 'O';
        filledBoxes = filledBoxes! + 1;
        listBox[index] = 1;
      }
      turnOf = !turnOf!;
      winnerCheck();
    });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        xOrOList[i] = '';
        filledBoxes = 0;
        listBox[i] = 0;
      }
    });
  }

  void winnerCheck() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      _showAlertDialog('Winner', xOrOList[0]);

      return;
    }
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      _showAlertDialog('Winner', xOrOList[3]);

      return;
    }
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      _showAlertDialog('Winner', xOrOList[6]);

      return;
    }
    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      _showAlertDialog('Winner', xOrOList[0]);

      return;
    }
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      _showAlertDialog('Winner', xOrOList[1]);

      return;
    }
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      _showAlertDialog('Winner', xOrOList[2]);

      return;
    }
    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      _showAlertDialog('Winner', xOrOList[0]);

      return;
    }
    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      _showAlertDialog('Winner', xOrOList[2]);

      return;
    }
    if (filledBoxes == 9) {
      _showAlertDialog('Draw', '');
      _clearBoard();
    }
  }

  void _showAlertDialog(String title, String winner) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              title,
              style: const TextStyle(
                  fontFamily: 'SFPro',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black),
            ),
            content: Container(
                alignment: Alignment.center,
                child: RichText(
                    text: winner == ''
                        ? const TextSpan(
                            text: 'The match ended in draw',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SFPro',
                                color: Colors.black))
                        : TextSpan(
                            text: 'The winner is ',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'SFPro',
                                color: Colors.black),
                            children: [
                                TextSpan(
                                  text: winner,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SFPro',
                                      color: winner == 'X'
                                          ? Colors.red
                                          : Colors.green),
                                )
                              ]))),
            actions: [
              CupertinoDialogAction(
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SFPro'),
                  ),
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                    setState(() {
                      turnOf = true;
                    });
                  }),
            ],
          );
        });

    if (winner == 'O') {
      scoreO = scoreO! + 1;
    } else if (winner == 'X') {
      scoreX = scoreX! + 1;
    }
  }
}
