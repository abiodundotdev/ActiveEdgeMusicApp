import 'package:activeedgemusic/screens/homepage.dart';
import 'package:activeedgemusic/util/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ActiveEdge Technologies',
      theme: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: appColor1,
          ),
          primaryColor: appColor1,
          iconTheme: IconThemeData(
            color: appColor1,
            size: 30.0,
          ),
          textTheme: TextTheme(
              bodyText2: GoogleFonts.montserrat(
            color: appColor1,
          ))),
      home: MyHomePage(),
    );
  }
}
