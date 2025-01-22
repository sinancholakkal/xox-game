import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  bool isSinglePlayer;
  GameScreen({super.key, required this.isSinglePlayer});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  late List<List<String>> board;
  late bool xTurn;
  late bool gameOver;
  late String winner;
  bool isComputerThinking = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeGame();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.elasticInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void initializeGame() {
    xTurn = true;
    gameOver = false;
    winner = '';
    isComputerThinking = false;
  }

  void shoGameOverDialog() {
    _animationController.forward(from: 0.0);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ScaleTransition(
          scale: _scaleAnimation,
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                content: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: winner =="Draw" ? Colors.orange :winner =="X"?Colors.blue:Colors.pink
                        ),
                        child: Icon( winner == "Draw" ? Icons.balance : winner == "X" ? Icons.close : Icons.circle_outlined),
                      ),
                    ],
                  ),
                ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
