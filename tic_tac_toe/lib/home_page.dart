import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onTurn = true; // first pleyer in O
  List<String> displayExO = [
    '',
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

  void tapped(int index) {
    setState(() {
      if (onTurn) {
        displayExO[index] = 'O';
      } else {
        displayExO[index] = 'X';
      }
      onTurn = !onTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    // equality for each row
    if (displayExO[0] == displayExO[1] &&
        displayExO[0] == displayExO[2] &&
        displayExO[0] != '') {
      winnerDialog(displayExO[0]);
    }
    if (displayExO[3] == displayExO[4] &&
        displayExO[3] == displayExO[5] &&
        displayExO[3] != '') {
      winnerDialog(displayExO[3]);
    }
    if (displayExO[6] == displayExO[7] &&
        displayExO[6] == displayExO[8] &&
        displayExO[6] != '') {
      winnerDialog(displayExO[6]);
    }
// equality for each column
    if (displayExO[0] == displayExO[3] &&
        displayExO[0] == displayExO[6] &&
        displayExO[0] != '') {
      winnerDialog(displayExO[0]);
    }

    if (displayExO[1] == displayExO[4] &&
        displayExO[1] == displayExO[7] &&
        displayExO[1] != '') {
      winnerDialog(displayExO[1]);
    }
    if (displayExO[2] == displayExO[5] &&
        displayExO[2] == displayExO[8] &&
        displayExO[2] != '') {
      winnerDialog(displayExO[2]);
    }

    // equality for right line
    if (displayExO[0] == displayExO[4] &&
        displayExO[0] == displayExO[8] &&
        displayExO[0] != '') {
      winnerDialog(displayExO[0]);
    }

    // equality for left line
    if (displayExO[2] == displayExO[4] &&
        displayExO[2] == displayExO[6] &&
        displayExO[2] != '') {
      winnerDialog(displayExO[2]);
    }
  }

  void winnerDialog(String winner) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("winner is "+ winner),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Center(
                child: Text(
                  displayExO[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
