import 'dart:ui';

class TrikiGameModel {
  late List<List<String>> _board;
  late String _currentPlayer;
  late bool _gameOver;
  bool _isGameStarted = false;
  final player1Color = const Color(0xFFf6f4e7);
  final player2Color = const Color(0xFFe3e2cb);

  TrikiGameModel() {
    _initializeBoard();
  }

  void _initializeBoard() {
    _board = List.generate(3, (_) => List.generate(3, (_) => ""));
    _currentPlayer = "O";
    _gameOver = false;
  }

  bool makeMove(int row, int col) {
    if (!_gameOver && _board[row][col] == "") {
      _board[row][col] = _currentPlayer;
      if (!_isGameStarted) {
        _isGameStarted = true;
      }
      if (checkWinner(_currentPlayer)) {
        _gameOver = true;
        return true;
      } else if (_checkBoard()) {
        _gameOver = true;
        return false;
      } else {
        _currentPlayer = (_currentPlayer == "X") ? "O" : "X";
      }
      return true;
    }
    return false;
  }

  bool checkWinner(String player) {
    if (checkRows(player) || checkColumns(player) || checkDiagonals(player)) {
      return true;
    }
    return false;
  }

  bool checkRows(String player) {
    for (int i = 0; i < 3; i++) {
      if (_board[i][0] == player &&
          _board[i][1] == player &&
          _board[i][2] == player) {
        return true;
      }
    }
    return false;
  }

  bool checkColumns(String player) {
    for (int i = 0; i < 3; i++) {
      if (_board[0][i] == player &&
          _board[1][i] == player &&
          _board[2][i] == player) {
        return true;
      }
    }
    return false;
  }

  bool checkDiagonals(String player) {
    if ((_board[0][0] == player &&
            _board[1][1] == player &&
            _board[2][2] == player) ||
        (_board[0][2] == player &&
            _board[1][1] == player &&
            _board[2][0] == player)) {
      return true;
    }
    return false;
  }

  bool _checkBoard() {
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (_board[row][col] == "") {
          return false;
        }
      }
    }
    return true;
  }

  List<List<String>> get board => _board;
  String get currentPlayer => _currentPlayer;
  bool get isGameStarted => _isGameStarted;
  bool get gameOver => _gameOver;

  set isGameStarted(bool value) {
    _isGameStarted = value;
  }
}
