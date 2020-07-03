import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SelfAsses extends StatefulWidget {
  @override
  _SelfAssesState createState() => _SelfAssesState();
}

class _SelfAssesState extends State<SelfAsses> {
  int counter = 0;
  String status = "Not Tested";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 70),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    width: 306,
                    height: 180,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFF48C2B), Color(0xDDFDC23A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "Please note that information form this chat will be used for monitoring & management of the current"
                      "health crisis and research in the fight against COVID-19",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                  child: Container(
                    width: 306,
                    height: 100,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF68A355), Color(0xDD8FC83D)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xFF38C3FF),
                    ),
                    child: Center(
                        child: Text(
                      "Are you experiencing any of the following symptoms?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 8, top: 8),
                      child: _getToggleChild(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 35),
                  child: GestureDetector(
                    child: Image.asset("assete/close.png"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                //SizedBox(width: 10.0,),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0, right: 15.0),
                  child: GestureDetector(
                      onTap: () {
                        final RenderBox box = context.findRenderObject();
                        Share.share(status,
                            subject: "My Covid-19 Status",
                            sharePositionOrigin:
                                box.localToGlobal(Offset.zero) & box.size);
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

  _getToggleChild() {
    if (counter == 2) {
      return Container(
        width: 122,
        height: 46,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF75E6B), Color(0xDDF69835)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          "Fever",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      );
    } else if (counter == 1) {
      return Container(
        width: 92,
        height: 46,
        margin: EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF75E6B), Color(0xDDF69835)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
            child: Text(
          "Cough",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      );
    } else if (counter == 3) {
      return Container(
        width: 212,
        margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
        height: 46,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF75E6B), Color(0xDDF69835)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
            child: Text(
          "Difficulty in Breathing",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      );
    } else if (counter == 4) {
      return Container(
        width: 192,
        height: 46,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF75E6B), Color(0xDDF69835)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
            child: Text(
          "None of the Above",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      );
    } else if (counter == 0) {
      return Container(
        margin: EdgeInsets.only(left: 15, top: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 92,
                  height: 46,
                  margin: EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFF75E6B), Color(0xDDF69835)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                      child: Text(
                    "Cough",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      counter = 1;
                      status = "Cough";
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        counter = 2;
                        status = "Fever";
                      });
                    },
                    child: Container(
                      width: 92,
                      height: 46,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFF75E6B), Color(0xDDF69835)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Text(
                        "Fever",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  counter = 3;
                  status = "Difficulty in breathing";
                });
              },
              child: Container(
                width: 212,
                margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                height: 46,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF75E6B), Color(0xDDF69835)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                    child: Text(
                  "Difficulty in Breathing",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  status = "I don't know";
                  counter = 4;
                });
              },
              child: Container(
                width: 192,
                height: 46,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF75E6B), Color(0xDDF69835)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                    child: Text(
                  "None of the Above",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      );
    }
  }
}
