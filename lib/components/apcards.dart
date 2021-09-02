import 'package:activeedgemusic/screens/albums.dart';
import 'package:activeedgemusic/screens/tweets.dart';
import 'package:activeedgemusic/util/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCards {
  Widget artistCard(context, data) {
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
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArtistAlbum(
                        artistId: data['id'],
                        name: data['name'],
                      ),
                    ));
              },
              child: Container(
                padding: EdgeInsets.all(
                  15.0,
                ),
                decoration: BoxDecoration(
                  color: appColor1,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  "ALBUMS",
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArtistTweets(
                        artistId: data['id'],
                        name: data['name'],
                      ),
                    ));
              },
              child: Container(
                padding: EdgeInsets.all(
                  15.0,
                ),
                decoration: BoxDecoration(
                  color: appColor2,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  "Tweets",
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(data['name'].toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
