import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/board.dart';
import 'package:tictactoe/boardState.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final myTheme = ThemeData(
    brightness: Brightness.dark,
    
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: ChangeNotifierProvider(
        builder: (context) => BoardState(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tic Tac Toe"),
          ),
          body: Board(),
        ),
      ),
    );
  }
}
