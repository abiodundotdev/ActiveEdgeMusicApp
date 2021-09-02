import 'package:activeedgemusic/api/api.dart';
import 'package:activeedgemusic/util/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ArtistTweets extends StatefulWidget {
  final dynamic artistId;
  final dynamic name;
  ArtistTweets({Key key, this.artistId, this.name}) : super(key: key);

  @override
  _ArtistTweetsState createState() => _ArtistTweetsState();
}

class _ArtistTweetsState extends State<ArtistTweets> {
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
              child: Text("Showing All Tweets For " + widget.name.toString()),
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
              future: fetchServerData("comments"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var das = snapshot.data
                      .where((i) => i['postId'] == widget.artistId)
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
                          subtitle: Text(das[item]['name']),
                          title: Text(das[item]['body']),
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
