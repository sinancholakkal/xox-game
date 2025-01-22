import 'package:flutter/material.dart';
import 'package:xox_game/presentation/pages/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 8, 35, 93),
          const Color.fromARGB(255, 149, 43, 43)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                "XOX",
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Spacer(),
              SizedBox(
                height: 50,
              ),
              ButtonWidget(
                text: "Two Player",
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return GameScreen(isSinglePlayer: false);
                  }));
                },
              ),
              SizedBox(
                height: 50,
              ),
              ButtonWidget(
                text: "Player vs Computer",
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return GameScreen(isSinglePlayer: true);
                  }));
                },
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  String text;
  void Function()? ontap;
  ButtonWidget({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            backgroundColor: Colors.amberAccent),
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ));
  }
}
