import 'package:flutter/material.dart';

import '../../controller/triki_game_controller.dart';
import '../../model/triki_game_model.dart';
import '../../utils/responsive.dart';

Column GameBoard(BuildContext context,
  TrikiGameModel gameState,
  TrikiGameController _controller,
  void Function(VoidCallback) setState,
) {
  return Column(
    children: [
      SizedBox(
        height: Responsive.distancePercentFromHeight(context, 17.9372),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: Responsive.distancePercentFromHeight(context, 4.4843),
            width: Responsive.distancePercentFromWidth(context, 34.9515),
            decoration: BoxDecoration(
              color: gameState.currentPlayer == "O"
                  ? gameState.player1Color
                  : gameState.player2Color,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              'Jugador 1 O',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: const Color(0xFF6750A4),
                fontSize: Responsive.distancePercentText(context, 1.7937),
              ),
            ),
          ),
          SizedBox(
            width: Responsive.distancePercentFromWidth(context, 4.8544),
          ),
          Container(
            alignment: Alignment.center,
            height: Responsive.distancePercentFromHeight(context, 4.4843),
            width: Responsive.distancePercentFromWidth(context, 34.9515),
            decoration: BoxDecoration(
              color: gameState.currentPlayer == "X"
                  ? gameState.player1Color
                  : gameState.player2Color,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              'Jugador 2 X',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: const Color(0xFF6750A4),
                fontSize: Responsive.distancePercentText(context, 1.7937),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: Responsive.distancePercentFromHeight(context, 4.9327),
      ),
      InkWell(
        onTap: () {
          _controller.resetGame();
          setState(() {});
        },
        child: Text(
          gameState.isGameStarted ? 'Reiniciar' : 'Inicia la partida',
          style: TextStyle(
              fontSize: Responsive.distancePercentText(context, 2.6906)),
        ),
      ),
      SizedBox(
        height: Responsive.distancePercentFromHeight(context, 6.2780),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int row = 0; row < 3; row++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int col = 0; col < 3; col++)
                    GestureDetector(
                      onTap: () {
                        _controller.onCellTapped(row, col);
                        setState(() {});
                      },
                      child: Container(
                        width: Responsive.distancePercentFromWidth(
                            context, 24.2718),
                        height: Responsive.distancePercentFromHeight(
                            context, 11.2108),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: const Color(0xFF644381),
                              width: row > 0 ? 5 : 0.01,
                            ),
                            left: BorderSide(
                              color: const Color(0xFF644381),
                              width: col > 0 ? 5 : 0.01,
                            ),
                          ),
                        ),
                        child: Center(
                          child: gameState.board[row][col] == "X"
                              ? Image.asset(
                                  'assets/images/X.png',
                                  fit: BoxFit.contain,
                                )
                              : gameState.board[row][col] == "O"
                                  ? Image.asset('assets/images/O.png',
                                      fit: BoxFit.contain)
                                  : null,
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
      const Expanded(child: SizedBox.shrink()),
      Padding(
        padding: EdgeInsets.only(
          bottom: Responsive.distancePercentFromHeight(context, 3.1390),
        ),
        child: Image(
          image: const AssetImage('assets/images/pragma-patreon.png'),
          height: Responsive.distancePercentFromHeight(context, 5.9417),
          width: Responsive.distancePercentFromWidth(context, 83.4951),
        ),
      ),
    ],
  );
}
