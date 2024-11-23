import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

import 'package:google_fonts/google_fonts.dart';
class LocationButton extends StatefulWidget {
  const LocationButton({super.key});

  @override
  State<LocationButton> createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButton> {
  String unicodeCharacter = String.fromCharCode(0xE0A9);
  bool is_hover=false;
  @override
  Widget build(BuildContext context) {
    return                  Container(
        alignment: Alignment.center, // Center alignment
        padding: EdgeInsets.only(
          top: 11,
          bottom: 20,
          left: 0,
          right: 60,
        ),
        width: 0.3 * MediaQuery.of(context).size.width, // Fixed width
        child:
    InkWell(
    onTap: (){
    js.context.callMethod('open', ['https://mannnnnn.zohobackstage.in/kalykalyaa']);
    },
    onHover: (e){
    is_hover=e;
    setState(() {

    });
    },child:
        AnimatedContainer(
          duration: Duration(
             milliseconds: 300
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:is_hover?Colors.white:Colors.black,
            border: Border.all(
              color: Colors.black,
              width: 2
            )
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust padding as needed
          child: Text(
            "Chennai📍",
            style:GoogleFonts.archivoBlack(color:
            is_hover?Colors.black:Colors.white,

            ),
          ),
        ),)
    );
  }
}
