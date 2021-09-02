import 'package:activeedgemusic/api/api.dart';
import 'package:activeedgemusic/util/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ArtistAlbum extends StatefulWidget {
  final dynamic artistId;
  final dynamic name;
  ArtistAlbum({Key key, this.artistId, this.name}) : super(key: key);

  @override
  _ArtistAlbumState createState() => _ArtistAlbumState();
}

class _ArtistAlbumState extends State<ArtistAlbum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: appColor2,
              ),
              child: Text("Showing Albums For " + widget.name.toString()),
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: fetchServerData("albums"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var das = snapshot.data
                      .where((i) => i['userId'] == widget.artistId)
                      .toList();
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: das.length,
                    shrinkWrap: true,
                    itemBuilder: (context, item) {
                      return Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(
                          title: Text(das[item]['title']),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Lottie.asset("assets/lottie/musicloading.json"),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
