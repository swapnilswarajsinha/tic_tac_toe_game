import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;

  CustomDialog(
    this.title,
    this.content,
    this.callback,
  );
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: GoogleFonts.bebasNeue(color: Colors.black),
      ),
      content: Text(content, style: GoogleFonts.bebasNeue(color: Colors.black)),
      actions: <Widget>[
        TextButton(
          onPressed: callback,
          child: Text(
            "RESET",
            style: GoogleFonts.bebasNeue(color: Colors.black),
          ),
        )
      ],
    );
  }
}
