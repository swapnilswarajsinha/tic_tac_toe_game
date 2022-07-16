import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/selection_screen.dart';

void main() => runApp(const MyApp());

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
      home: AnimatedSplashScreen(
          curve: Curves.slowMiddle,
          splashIconSize: 304,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/Images/logo.png",
                height: 250,
                width: 250,
              ),
              Text(
                "Tic Tac Toe",
                style: GoogleFonts.roboto(
                    fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          nextScreen: SelectionScreen()),
    );
  }
}
