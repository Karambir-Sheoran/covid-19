import 'dart:convert';

import 'package:covid19/pages/staticReport.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StaticPage extends StatefulWidget {
  @override
  _StaticPageState createState() => _StaticPageState();
}

class _StaticPageState extends State<StaticPage> {
  Future<Map<dynamic, dynamic>> fetchDaily() async {
    var result = await http.get("https://api.covid19api.com/summary");
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
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
                    Container(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * (30 / 960),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Image.asset("assete/symptoms.png")),
                          Container(
                            height: 165,
                            //width: 150,
                            margin: const EdgeInsets.only(bottom: 20, top: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green[50]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                color: Colors.green[50]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Worldwide ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          WidgetSpan(
                                            child: Icon(Icons.arrow_downward,
                                                size: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text("Confirmed",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54)),
                                        FutureBuilder<Map<dynamic, dynamic>>(
                                            future: fetchDaily(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot snapshot) {
                                              if (snapshot.hasData) {
                                                return Text(
                                                  "${(snapshot.data["Global"]["TotalConfirmed"] / 1000).toStringAsFixed(1)}k",
                                                  style: TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                );
                                              } else {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      height: 68,
                                      width: 134,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.pink[50]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Dead",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54)),
                                          Center(
                                            child: FutureBuilder<
                                                    Map<dynamic, dynamic>>(
                                                future: fetchDaily(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Text(
                                                      "${(snapshot.data["Global"]["TotalDeaths"] / 1000).toStringAsFixed(1)}k",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    );
                                                  } else {
                                                    return Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 68,
                                      width: 134,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green[100],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Recovered",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54)),
                                          FutureBuilder<Map<dynamic, dynamic>>(
                                              future: fetchDaily(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    "${(snapshot.data["Global"]["TotalRecovered"] / 1000).toStringAsFixed(1)}k",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  );
                                                } else {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green[50]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                    color: Colors.green[50]),
                                child: Center(
                                  child: Text(
                                    "Active Cases",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 73,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green[50]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                    color: Colors.green[50]),
                                child: Center(
                                  child: Text(
                                    "Dead",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                  height: 40,
                                  width: 105,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.green[50]),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      color: Colors.green[50]),
                                  child: Center(
                                    child: Text(
                                      "Recovered",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Top Country",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'country');
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 70,
                                    child: Center(
                                      child: Text(
                                        "View all",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StaticReport(
                                                  counter: 177,
                                                  name: "USA",
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10, right: 25),
                                    height: 232,
                                    width: 164,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      color: Color(0xFF348A7B),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 40),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(Icons.add_location),
                                              Text("USA",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                              FutureBuilder<
                                                      Map<dynamic, dynamic>>(
                                                  future: fetchDaily(),
                                                  builder: (BuildContext
                                                          context,
                                                      AsyncSnapshot snapshot) {
                                                    if (snapshot.hasData) {
                                                      return Text(
                                                        "${(snapshot.data["Countries"][177]["TotalConfirmed"] / 1000).toStringAsFixed(1)}k",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      );
                                                    } else {
                                                      return Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                  }),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: Image.asset(
                                          "assete/graph.png",
                                          color: Colors.white54,
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StaticReport(
                                                  counter: 23,
                                                  name: "Brazil",
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10, right: 25),
                                    height: 232,
                                    width: 164,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      color: Color(0xFFFF8367),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 40),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(Icons.add_location),
                                              Text("BRAZIL",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                              FutureBuilder<
                                                      Map<dynamic, dynamic>>(
                                                  future: fetchDaily(),
                                                  builder: (BuildContext
                                                          context,
                                                      AsyncSnapshot snapshot) {
                                                    if (snapshot.hasData) {
                                                      return Text(
                                                        "${(snapshot.data["Countries"][23]["TotalConfirmed"] / 1000).toStringAsFixed(1)}k",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      );
                                                    } else {
                                                      return Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                  }),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: Image.asset(
                                          "assete/graph.png",
                                          color: Colors.white54,
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StaticReport(
                                                  counter: 76,
                                                  name: "India",
                                                )));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: 232,
                                    width: 164,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      color: Color(0xFF38C3FF),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 40),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(Icons.add_location),
                                              Text("INDIA",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                              FutureBuilder<
                                                      Map<dynamic, dynamic>>(
                                                  future: fetchDaily(),
                                                  builder: (BuildContext
                                                          context,
                                                      AsyncSnapshot snapshot) {
                                                    if (snapshot.hasData) {
                                                      return Text(
                                                        "${(snapshot.data["Countries"][76]["TotalConfirmed"] / 1000).toStringAsFixed(1)}k",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      );
                                                    } else {
                                                      return Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                  }),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: Image.asset(
                                          "assete/graph.png",
                                          color: Colors.white54,
                                        )),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(10),
                            height: 124,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF68A355), Color(0xDD8FC83D)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xFF38C3FF),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Covid-19 Do's & Don'ts",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(10),
                            height: 124,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF68A355), Color(0xDD8FC83D)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xFF38C3FF),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Learn more about Covid-19",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(10),
                            height: 124,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF68A355), Color(0xDD8FC83D)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xFF38C3FF),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Safety measures against Covid-19",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
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
                  padding: const EdgeInsets.only(left: 15, top: 43),
                  child: GestureDetector(
                    child: Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assete/Vector1.png")),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                //SizedBox(width: 10.0,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
