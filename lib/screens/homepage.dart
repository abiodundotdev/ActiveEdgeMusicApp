import 'package:activeedgemusic/util/appcolor.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                                child: Center(
                                  child: Text('Display Tab 3',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text('Display Tab 4',
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
