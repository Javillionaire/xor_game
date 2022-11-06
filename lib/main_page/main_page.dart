import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
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
                            color: Colors.black),
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
                                    fontFamily: 'Quick'),
                                children: [
                              TextSpan(
                                text: ' or ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Quick'),
                              ),
                              TextSpan(
                                text: 'O',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Quick'),
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
                                  fontFamily: 'Quick'),
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
                                  fontFamily: 'Quick'),
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
            text: const TextSpan(
                text: 'X',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quick'),
                children: [
              TextSpan(
                text: ' or ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quick'),
              ),
              TextSpan(
                text: 'O',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quick'),
              )
            ])),
        actions: [
          IconButton(
              onPressed: () {
                _clearBoard();
              },
              icon: const Icon(Icons.restart_alt)),
          IconButton(
              onPressed: () {
                setState(() {
                  scoreO = 0;
                  scoreX = 0;
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
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
              RichText(
                  text: const TextSpan(
                      text: 'Player',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quick'),
                      children: [
                    TextSpan(
                      text: ' X ',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quick'),
                    )
                  ])),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Score: ',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quick'),
                      children: [
                    TextSpan(
                      text: scoreX.toString(),
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quick'),
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
              RichText(
                  text: const TextSpan(
                      text: 'Player',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quick'),
                      children: [
                    TextSpan(
                      text: ' O ',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quick'),
                    )
                  ])),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Score: ',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quick'),
                      children: [
                    TextSpan(
                      text: scoreO.toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quick'),
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
                      fontFamily: 'Quick',
                      fontWeight: FontWeight.w500))
            ],
                text: 'Turn of ',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quick',
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
                          fontFamily: 'Quick',
                          fontSize: 40,
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

  ///asinxron
/* 
  void _clearBoard() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        for (int i = 0; i < 9; i++) {
          xOrOList[i] = '';
          filledBoxes = 0;
        }
      });
    });
  } */

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

  ///asinxron
/*   void _showAlertDialog(String title, String winner) async {
    Future.delayed(const Duration(milliseconds: 500), () {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text(
                title,
                style: const TextStyle(
                    fontFamily: 'Quick',
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
                                  fontFamily: 'Quick',
                                  color: Colors.black))
                          : TextSpan(
                              text: 'The winner is ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Quick',
                                  color: Colors.black),
                              children: [
                                  TextSpan(
                                    text: winner,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Quick',
                                        color: winner == 'X'
                                            ? Colors.red
                                            : Colors.green),
                                  )
                                ])) /* Text(
                winner == ''
                    ? 'The match ended in a draw'
                    : 'The winner is $winner',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quick',
                    color: winner == 'X' ? Colors.red : Colors.green),
              ), */
                  ),
              actions: [
                CupertinoDialogAction(
                    child: const Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quick'),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        turnOf = true;
                      });
                    }),
              ],
            );
          });
    });

    if (winner == 'O') {
      scoreO = scoreO! + 1;
    } else if (winner == 'X') {
      scoreX = scoreX! + 1;
    }
  }
} */
  void _showAlertDialog(String title, String winner) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Quick',
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
                                fontFamily: 'Quick',
                                color: Colors.black))
                        : TextSpan(
                            text: 'The winner is ',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Quick',
                                color: Colors.black),
                            children: [
                                TextSpan(
                                  text: winner,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Quick',
                                      color: winner == 'X'
                                          ? Colors.red
                                          : Colors.green),
                                )
                              ])) /* Text(
                winner == ''
                    ? 'The match ended in a draw'
                    : 'The winner is $winner',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quick',
                    color: winner == 'X' ? Colors.red : Colors.green),
              ), */
                ),
            actions: [
              CupertinoDialogAction(
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Quick'),
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
