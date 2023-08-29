import 'package:flutter/material.dart';
import 'package:triki_app/controller/triki_game_controller.dart';
import 'package:triki_app/model/triki_game_model.dart';
import 'package:triki_app/utils/responsive.dart';

import '../widgets/game_board.dart';
import '../widgets/winner_dialog.dart';

class TrikiGameView extends StatefulWidget {
  const TrikiGameView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  State<TrikiGameView> createState() => _TrikiGameViewState();
}

class _TrikiGameViewState extends State<TrikiGameView> {
  late TrikiGameController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TrikiGameController(onShowWinner: _showWinnerDialog);
  }

  void _showWinnerDialog(String winner) {
    String winnerText = (winner == "O") ? "1" : "2";
    showDialog<String>(
        // ignore: prefer_const_constructors
        context: context,
        builder: (BuildContext context) => AlertDialog(
              elevation: 12,
              shadowColor: Colors.black,
              backgroundColor: const Color(0xFFEADDFF),
              content: winnerDialog(winnerText: winnerText),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final gameState = _controller.getGameState();

    return Scaffold(
        backgroundColor: const Color(0xFFD0BCFF),
        body: GameBoard(context, gameState, _controller, setState));
  }
}
