import 'package:triki_app/model/triki_game_model.dart';

class TrikiGameController {
  late TrikiGameModel _model;
  final void Function(String) onShowWinner;

  TrikiGameController({required this.onShowWinner}) {
    _model = TrikiGameModel();
  }

  void onCellTapped(int row, int col) {
    if (_model.makeMove(row, col)) {
      if (_model.checkWinner(_model.currentPlayer)) {
        onShowWinner(_model.currentPlayer);
      }
    }
  }

  TrikiGameModel getGameState() {
    return _model;
  }

  void resetGame() {
    _model = TrikiGameModel();
  }
}
