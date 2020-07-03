import 'dart:async';

import 'package:covid19/pages/Countries.dart';
import 'package:covid19/pages/selfAsses.dart';
import 'package:covid19/pages/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.lightBlue,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Rajdhani",
      ),
      //home: MyHomePage(),

      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        //'staticRep': (context) => StaticReport(),
        'staticPage': (context) => StaticPage(),
        'selfAsses': (context) => SelfAsses(),
        'country': (context) => Countries(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _time = "Welcome";
  int _hour;

  @override
  void initState() {
    _hour = new DateTime.now().hour;
    if (_hour > 5 && _hour < 12) {
      _time =
          "Good Morning ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    } else if (_hour > 12 && _hour < 15) {
      _time =
          "Good Afternoon ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    } else if (_hour >= 15 && _hour < 20) {
      _time =
          "Good Evening ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    } else {
      _time =
          "Good Night ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    }
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();
  }

  void _getCurrentTime() {
    setState(() {
      if (_hour >= 5 && _hour < 12) {
        _time =
            "Good Morning ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
      } else if (_hour >= 12 && _hour < 15) {
        _time =
            "Good Afternoon ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
      } else if (_hour >= 15 && _hour < 20) {
        _time =
            "Good Evening ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
      } else {
        _time =
            "Good Night ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
      }
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  final _controller = ScrollController();

  _animateToIndex(i) => _controller.animateTo(70 * i,
      duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: Text("Header"),
            ),
            ListTile(
              title: Text("Item1"),
              onTap: _closeDrawer,
            ),
            ListTile(
              title: Text("Item2"),
              onTap: _closeDrawer,
            ),
            ListTile(
              title: Text("Item3"),
              onTap: _closeDrawer,
            ),
            ListTile(
              title: Text("Item4"),
              onTap: _closeDrawer,
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            controller: _controller,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        "assete/Group19.png",
                        width: 280,
                        //width: MediaQuery.of(context).size.width * (312 / 458),
                        //height: MediaQuery.of(context).size.height * (213 / 960),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * (150 / 960),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              _time,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 3),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Stay Home Stay Safe",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "staticPage");
                              },
                              child: Image.asset(
                                "assete/statReport.png",
                                //height: MediaQuery.of(context).size.height * (111 / 960),
                                //width: MediaQuery.of(context).size.height * (202 / 458),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _animateToIndex(10.0);
                              },
                              child: Image.asset(
                                "assete/infoVideos.png",
                                //height: MediaQuery.of(context).size.height * (111 / 960),
                                //width: MediaQuery.of(context).size.height * (201 / 458),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _animateToIndex(20.0);
                              },
                              child: Image.asset(
                                "assete/comTopics.png",
                                //height: MediaQuery.of(context).size.height * (111 / 960),
                                //width: MediaQuery.of(context).size.height * (202 / 458),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "selfAsses");
                              },
                              child: Image.asset(
                                "assete/selfAsses.png",
                                //height: MediaQuery.of(context).size.height * (111 / 960),
                                //width: MediaQuery.of(context).size.height * (201 / 458),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: Center(
                        child: Text(
                          "How to maintain social distancing:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Image.asset("assete/Group14.png"),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("assete/Group13.png"),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset("assete/Group12.png"),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        playYoutubeVideo(
                            "https://www.youtube.com/watch?v=CXOsVXybVJY");
                      },
                      child: Container(
                        child: Image.asset("assete/Youtube1.png"),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        playYoutubeVideo(
                            "https://www.youtube.com/watch?v=rAj38E7vrS8");
                      },
                      child: Container(
                        child: Image.asset("assete/Youtube2.png"),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        playYoutubeVideo(
                            "https://www.youtube.com/watch?v=1APwq1df6Mw");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Image.asset("assete/Youtube3.png"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _launched = _launchInBrowser(
                                "https://www.mohfw.gov.in/pdf/Poster_Corona_ad_Eng.pdf");
                          });
                        },
                        child: Image.asset("assete/Group16.png")),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _launched = _launchInBrowser(
                                "https://www.who.int/health-topics/coronavirus#tab=tab_1");
                          });
                        },
                        child: Image.asset("assete/Group17.png")),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _launched = _launchInBrowser(
                                "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public#:~:text=By%20following%20good%20respiratory%20hygiene,situation%20in%20your%20area.");
                          });
                        },
                        child: Image.asset("assete/Group18.png")),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 35),
                  child: GestureDetector(
                    child: Image.asset("assete/Group10.png"),
                    onTap: () {
                      _openDrawer();
                    },
                  ),
                ),
                //SizedBox(width: 10.0,),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0, right: 15.0),
                  child: GestureDetector(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Image.asset("assete/Group11.png")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "OK",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Alert",
        style: TextStyle(color: Colors.red),
      ),
      content: Text(
        "First Go To Self Assess & Guidance",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void playYoutubeVideo(url) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "AIzaSyC7gogJ7CLMhlRTcjPyqODhTpydVwYDsNY",
      videoUrl: url,
    );
  }

  Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
