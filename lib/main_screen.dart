import 'package:flutter/material.dart';

import 'xo_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  XOManger xoManger = XOManger();
  Player player = Player.X;
  Winner winner = Winner.NONE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XO'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              padding: const EdgeInsets.all(20),
              itemCount: 9,
              itemBuilder: (_, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      final bool result = xoManger.changeColor(index, player);
                      if (!result) {
                        return;
                      }
                      player = xoManger.changePlayer(player);
                      winner = xoManger.getWinner();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: xoManger.getColor(index),
                      border: Border.all(),
                    ),
                  ),
                );
              },
            ),
          ),
          if (winner != Winner.NONE)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                winner == Winner.STALE
                    ? 'Stale!'
                    : '${winner == Winner.X ? 'X' : 'O'} a castigat, apasa pe buton pentru a reseta!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          if (winner != Winner.NONE)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 50,
                width: 200,
                child: FilledButton(
                  onPressed: () {
                    setState(() {
                      xoManger.resetColor();
                      winner = Winner.NONE;
                      player = Player.X;
                    });
                  },
                  child: const Text('Reset'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
