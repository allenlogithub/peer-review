import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Temp extends StatefulWidget {
  final String name;
  const Temp({Key? key, required this.name}) : super(key: key);

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'LOGIN as' + widget.name,
            style: GoogleFonts.lato(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ]);
  }
}
