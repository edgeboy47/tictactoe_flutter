import 'package:flutter/material.dart';

class BoardState with ChangeNotifier {
  List<List> _board = List.generate(3, (i)=> List.generate(3, (i) => null));
  
  bool _flag = true;

  bool _isDone = false;

  List<List> get board => _board;
  bool get flag => _flag;
  bool get isDone => _isDone;

  setIndex(int row, int col){
    if(_board[row][col] != null || _isDone) return;
    _board[row][col] = _flag ? "X" : "O";
    _flag = !_flag;

    if(_isGameDone()) _isDone = true;
    notifyListeners();
  }

  reset(){
    _board = List.generate(3, (i)=> List.generate(3, (i) => null));
    _flag = true;
    _isDone = false;
    notifyListeners();
  } 

  _isGameDone(){
    return _checkRows() || _checkColumns() || _checkDiagonals();
  }

  // Checks each row from top to bottom for the win condition
  _checkRows(){
    for(int i = 0; i < 3; i++)
      if(_board[i][0] != null && _board[i][0] == _board[i][1] && _board[i][1] == _board[i][2]) return true;
    return false;
  }

  // Checks each column from left to right for win condition
  _checkColumns(){
    for(int i = 0; i < 3; i++)
      if(_board[0][i] != null && _board[0][i] == _board[1][i] && _board[1][i] == _board[2][i]) return true;
    return false;
  }

  _checkDiagonals(){
    // top-left to bottom-right
    if(_board[0][0] != null && _board[0][0] == _board[1][1] && _board[1][1] == _board[2][2]) return true;

    // bottom-left to top-right
    if(_board[0][2] != null && _board[0][2] == _board[1][1] && _board[1][1] == _board[2][0]) return true;    
    return false;
  }

  @override
  void dispose() => super.dispose();
}