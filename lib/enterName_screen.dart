import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/home_page.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({Key? key}) : super(key: key);

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    
    FocusNode nameFocus = FocusNode();
    return GestureDetector(
      onTap: () {
        nameFocus.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black,
            automaticallyImplyLeading: false,
            leadingWidth: 100,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black54,
                    ),
                     const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Back",
                      style: GoogleFonts.roboto(
                          fontSize: 20, color: Colors.black54),
                    )
                  ],
                ),
              ),
            )),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "Please Enter Your Name ...",
                    hintStyle: GoogleFonts.bebasNeue(fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: nameController,
                focusNode: nameFocus,
                maxLength: 20,
                keyboardType: TextInputType.name,
              ),
              const  SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all( const Size(400, 60))),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: ((context) => HomePage(
                            player1Name: nameController.text.isNotEmpty
                                ? nameController.text
                                : "Player",
                            multiPlayer: false))));
                  },
                  child: Text(
                    "START THE GAME",
                    style: GoogleFonts.bebasNeue(fontSize: 25),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
