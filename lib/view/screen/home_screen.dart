import 'package:flutter/material.dart';
import 'package:triki_app/utils/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFFD0BCFF), body: TrikiGame());
  }
}

class TrikiGame extends StatefulWidget {
  const TrikiGame({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrikiGameState createState() => _TrikiGameState();
}

class _TrikiGameState extends State<TrikiGame> {
  late List<List<String>> _board;
  late String _currentPlayer;
  late bool _gameOver;
  bool _isGameStarted = false;
  final player1Color = const Color(0x0C596400);
  final player2Color = const Color(0x1E596400);

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    _board = List.generate(3, (_) => List.generate(3, (_) => ""));
    _currentPlayer = "X";
    _gameOver = false;
  }

  void _makeMove(int row, int col) {
    if (!_gameOver && _board[row][col] == "") {
      setState(() {
        _board[row][col] = _currentPlayer;
        if (!_isGameStarted) {
          _isGameStarted = true;
        }
        if (_checkWinner(_currentPlayer)) {
          _showWinnerDialog(_currentPlayer);
          _gameOver = true;
        } else if (_checkDraw()) {
          //Aqui podria mostrarse el dialogo de empate
          _gameOver = true;
        } else {
          _currentPlayer = (_currentPlayer == "X") ? "O" : "X";
        }
      });
    }
  }

  bool _checkWinner(String player) {
    // Verificar filas
    for (int row = 0; row < 3; row++) {
      if (_board[row][0] == player &&
          _board[row][1] == player &&
          _board[row][2] == player) {
        return true;
      }
    }

    // Verificar columnas
    for (int col = 0; col < 3; col++) {
      if (_board[0][col] == player &&
          _board[1][col] == player &&
          _board[2][col] == player) {
        return true;
      }
    }

    // Verificar diagonales
    if (_board[0][0] == player &&
        _board[1][1] == player &&
        _board[2][2] == player) {
      return true;
    }
    if (_board[0][2] == player &&
        _board[1][1] == player &&
        _board[2][0] == player) {
      return true;
    }

    return false;
  }

  bool _checkDraw() {
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (_board[row][col] == "") {
          // Si hay algún espacio vacío, el juego no ha terminado en empate.
          return false;
        }
      }
    }
    // Si no hay espacios vacíos, el juego ha terminado en empate.
    return true;
  }

  void _showWinnerDialog(String winner) {
    String winnerText = (winner == "X") ? "Jugador 1" : "Jugador 2";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("El $winnerText ha ganado."),
        );
      },
    );
  }

  //pensar en el metodo para mostrar alerta de empate

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFD0BCFF),
        body: Column(
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
                    color: _currentPlayer == "X" ? player1Color : player2Color,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Jugador 1 X',
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
                    color: _currentPlayer == "O" ? player1Color : player2Color,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Jugador 2 O',
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
                setState(() {
                  _initializeBoard();
                  _isGameStarted = false;
                });
              },
              child: Text(
                _isGameStarted ? 'Reiniciar' : 'Inicia la partida',
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
                            onTap: () => _makeMove(row, col),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: const Color(
                                        0xFF644381), // Cambiar el color según tus necesidades
                                    width: row > 0 ? 5 : 0.01,
                                  ),
                                  left: BorderSide(
                                    color: const Color(
                                        0xFF644381), // Cambiar el color según tus necesidades
                                    width: col > 0 ? 5 : 0.01,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: _board[row][col] == "X"
                                    ? Image.asset('assets/images/X.png',
                                        width: 50,
                                        height:
                                            50) // Cambiar ruta y tamaño según tus necesidades
                                    : _board[row][col] == "O"
                                        ? Image.asset('assets/images/O.png',
                                            width: 50,
                                            height:
                                                50) // Cambiar ruta y tamaño según tus necesidades
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
        ));
  }
}
