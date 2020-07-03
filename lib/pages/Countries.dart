import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Job {
  /*final int id;
  final String position;
  final String company;*/
  final String description;

  Job({this.description});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      /*id: json['id'],
      position: json['position'],
      company: json['company'],*/
      description: json['Country'],
    );
  }
}

class Countries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 40, top: 90),
            height: 40,
            width: 290,
            child: Center(
                child: TextField(
                    decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13))),
              icon: Icon(Icons.search),
              labelText: "Search here",
            ))),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.only(top: 90),
            child: GestureDetector(
              onTap: () {
                print("clicked");
              },
              child: FutureBuilder<List<Job>>(
                future: _fetchJobs(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Job> data = snapshot.data;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              final snackBar = SnackBar(
                                duration: const Duration(milliseconds: 100),
                                content: Text(
                                    'You clicked on ${data[index].description}'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                            title: Text(data[index].description,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                )),
                            subtitle: Text("subtitle"),
                            leading: Icon(
                              Icons.flag,
                              color: Colors.blue[500],
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
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
                Container(
                    height: 40,
                    margin: EdgeInsets.only(right: 90, top: 43),
                    child: Center(
                      child: Text(
                        "Choose your country",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ))
                //SizedBox(width: 10.0,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Job>> _fetchJobs() async {
    final jobsListAPIUrl = 'https://api.covid19api.com/countries';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}
