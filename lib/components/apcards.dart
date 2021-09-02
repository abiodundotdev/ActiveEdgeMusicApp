import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCards {
  Container artistCard(data) {
    return Container(
      width: 300.0,
      height: 200.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/tecno.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 50.0,
        child: Text(data['name'].toString(),
            style: GoogleFonts.montserrat(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
