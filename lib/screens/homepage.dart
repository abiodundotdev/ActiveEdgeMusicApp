import 'package:activeedgemusic/api/api.dart';
import 'package:activeedgemusic/components/apcards.dart';
import 'package:activeedgemusic/util/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.search_outlined,
          color: appColor1,
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: appColor1,
            size: 30.0,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(
          20.0,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Text(
              "Browse",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                  ),
            ),
            SizedBox(
              height: 20.0,
            ),
            DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          labelColor: appColor2,
                          indicatorColor: appColor1,
                          unselectedLabelColor: appColor1,
                          tabs: [
                            Tab(text: 'Artist'),
                            Tab(text: 'Albums'),
                          ],
                        ),
                      ),
                      Container(
                          height: 400, //height of TabBarView
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(
                            children: <Widget>[
                              Container(
                                child: FutureBuilder(
                                  future: fetchServerData(
                                      "users?_start=0&_limit=10"),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                        itemCount: snapshot.data.length,
                                        shrinkWrap: true,
                                        cacheExtent: 9999,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, item) {
                                          return CustomCards().artistCard(
                                              context, snapshot.data[item]);
                                        },
                                      );
                                    } else {
                                      return Center(
                                        child: Lottie.asset(
                                            "assets/lottie/musicloading.json"),
                                      );
                                    }
                                  },
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text('Albums Loading Please Wait',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ))
                    ])),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Play Music',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
