import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  final double size;

  // ignore: non_constant_identifier_names
  const ModifiedText({Key? key, required this.text,  required this.size}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: GoogleFonts.playfairDisplay(
        color: Theme.of(context).splashColor, fontSize: size
    ),
    );
  }
}
