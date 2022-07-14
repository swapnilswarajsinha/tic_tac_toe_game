import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/selection_screen.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.black,
              secondary: Colors.white,
            ),
      ),
      home:  const SelectionScreen(),
    );
  }
}
