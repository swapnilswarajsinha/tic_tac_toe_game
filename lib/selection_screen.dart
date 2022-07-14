import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/enterName_screen.dart';
import 'package:tic_tac_toe_game/enterNames_screen.dart';


class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Images/logo.png",
              height: 250,
              width: 250,
            ),
            Text(
              "Tic Tac Toe",
              style:
                  GoogleFonts.roboto(fontSize: 45, fontWeight: FontWeight.bold),
            ),
             const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) =>  const EnterNameScreen())));
              },
                 style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(250, 60)),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Icon(
                    Icons.person,
                    size: 30,
                  ),
                 const  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Single Player",
                    style: GoogleFonts.bebasNeue(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
           
            ),
           const  SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const EnterNamesScreen())));
              },
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(250, 60)),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.group,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Multi Player",
                    style: GoogleFonts.bebasNeue(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              
            ),
          ],
        ),
      )),
    );
  }
}
