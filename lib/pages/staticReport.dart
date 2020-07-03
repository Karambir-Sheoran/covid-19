import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StaticReport extends StatefulWidget {
  final counter;
  final name;

  StaticReport({Key key, @required this.counter, this.name}) : super(key: key);

  @override
  _StaticReportState createState() {
    return _StaticReportState(counter1: counter, name1: name);
  }
}

class _StaticReportState extends State<StaticReport> {
  final name1;
  final counter1;

  _StaticReportState({Key key, @required this.counter1, this.name1});

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
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * (110 / 960),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: name1,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                  WidgetSpan(
                                    child: Icon(Icons.arrow_downward, size: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF3B83BD),
                                          Color(0xEE1CBAE6)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                    ),
                                    height: 85,
                                    width: 150,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: FutureBuilder<
                                                    Map<dynamic, dynamic>>(
                                                future: fetchDaily(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Text(
                                                      "${snapshot.data["Countries"][counter1]["TotalConfirmed"]}",
                                                      style: TextStyle(
                                                          fontSize: 28,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    );
                                                  } else {
                                                    return Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }
                                                }),
                                          ),
                                          Text("Confirmed",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 85,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF68A355),
                                          Color(0xCC8FC83D)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: FutureBuilder<
                                                    Map<dynamic, dynamic>>(
                                                future: fetchDaily(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Text(
                                                      "${snapshot.data["Countries"][counter1]["TotalRecovered"]}",
                                                      style: TextStyle(
                                                          fontSize: 28,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    );
                                                  } else {
                                                    return Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }
                                                }),
                                          ),
                                          Text("Recovered",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    height: 85,
                                    width: 150,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: FutureBuilder<
                                                    Map<dynamic, dynamic>>(
                                                future: fetchDaily(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Text(
                                                      "${snapshot.data["Countries"][counter1]["TotalConfirmed"] - snapshot.data["Countries"][counter1]["TotalRecovered"]}",
                                                      style: TextStyle(
                                                          fontSize: 28,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    );
                                                  } else {
                                                    return Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }
                                                }),
                                          ),
                                          Text("Hospitalized",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFFF8A29),
                                          Color(0xEEFDC23A)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                    ),
                                  ),
                                  Container(
                                    height: 85,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFF75E6B),
                                          Color(0xEEF69835)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: FutureBuilder<
                                                    Map<dynamic, dynamic>>(
                                                future: fetchDaily(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Text(
                                                      "${snapshot.data["Countries"][counter1]["TotalDeaths"]}",
                                                      style: TextStyle(
                                                          fontSize: 28,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    );
                                                  } else {
                                                    return Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }
                                                }),
                                          ),
                                          Text("Death",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Cases ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                          text: "Today ",
                                          style: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        WidgetSpan(
                                          child: Icon(Icons.arrow_downward,
                                              size: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 65,
                                //width: 150,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    color: Color(0xFF3D6FB7)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: FutureBuilder<
                                                  Map<dynamic, dynamic>>(
                                              future: fetchDaily(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    "${snapshot.data["Countries"][counter1]["NewConfirmed"]}",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  );
                                                } else {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                              }),
                                        ),
                                        Text("Confirmed",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: FutureBuilder<
                                                  Map<dynamic, dynamic>>(
                                              future: fetchDaily(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    "${snapshot.data["Countries"][counter1]["NewRecovered"]}",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  );
                                                } else {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                              }),
                                        ),
                                        Text("Recovered",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: FutureBuilder<
                                                  Map<dynamic, dynamic>>(
                                              future: fetchDaily(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    "${snapshot.data["Countries"][counter1]["NewDeaths"]}",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  );
                                                } else {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                              }),
                                        ),
                                        Text("Death",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: Center(
                                  child: RichText(
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
                                ),
                              ),
                              Container(
                                height: 165,
                                //width: 150,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green[50]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                    color: Colors.green[50]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Confirmed",
                                            style: TextStyle(
                                                fontSize: 25,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54)),
                                              Center(
                                                child: FutureBuilder<
                                                        Map<dynamic, dynamic>>(
                                                    future: fetchDaily(),
                                                    builder:
                                                        (BuildContext context,
                                                            AsyncSnapshot
                                                                snapshot) {
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                          "${(snapshot.data["Global"]["TotalDeaths"] / 1000).toStringAsFixed(1)}k",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.green[100],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Recovered",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54)),
                                              FutureBuilder<
                                                      Map<dynamic, dynamic>>(
                                                  future: fetchDaily(),
                                                  builder: (BuildContext
                                                          context,
                                                      AsyncSnapshot snapshot) {
                                                    if (snapshot.hasData) {
                                                      return Text(
                                                        "${(snapshot.data["Global"]["TotalRecovered"] / 1000).toStringAsFixed(1)}k",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.green[50]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        color: Colors.green[50]),
                                    child: Center(
                                      child: Text(
                                        "Active Cases",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 73,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.green[50]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        color: Colors.green[50]),
                                    child: Center(
                                      child: Text(
                                        "Dead",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      height: 40,
                                      width: 105,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green[50]),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7)),
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
                            ],
                          ),
                        ),
                      ],
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
