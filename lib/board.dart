import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/boardState.dart';
import 'package:tictactoe/tile.dart';

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _boardState = Provider.of<BoardState>(context);
    final _board = _boardState.board;

    String status;

    if (_boardState.isDone) {
      status = "Winner: ${_boardState.flag ? "O" : "X"}";
    } else {
      status = "Next Player: ${_boardState.flag ? "X" : "O"}";
    }

    return Container(
        child: Center(
      child: Column(children: [
        Spacer(),
        Text(
          status,
          style: TextStyle(fontSize: 24),
        ),
        Spacer(),
        ...List.generate(_board.length, (row) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (col) => Tile(
                      val: _board[row][col] ?? "",
                      onClick: () => _boardState.setIndex(row, col))));
        }),
        Spacer(
          flex: 4,
        ),
        RaisedButton(
          child: Text("Reset"),
          onPressed: _boardState.reset,
        ),
        Spacer()
      ]),
    ));
  }
}
