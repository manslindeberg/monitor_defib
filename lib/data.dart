import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'nav_drawer.dart';
import 'text_section.dart';
import 'style.dart';

Future<Data> fetchData() async {
  final response = await http.get('http://192.168.4.1:80', headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Data.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Data {
  final String temp;
  final String volt;
  final String status;

  Data({this.temp, this.volt, this.status});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      temp: json['temp'],
      volt: json['volt'],
      status: json['status'],
    );
  }
}

class FetchData extends StatelessWidget {
  Future<Data> futureData = fetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff6807f9),
          title: Image.asset(
            "assets/images/app_banner.png",
            fit: BoxFit.contain,
          )),
      backgroundColor: Color(0xffe6e6fa),
      drawer: NavDrawer(),
      body: Center(
        child: StreamBuilder(
          stream: Stream.periodic(Duration(seconds:1 ))
          .asyncMap((i) => fetchData())  ,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
               children: [const SizedBox(height: 40),
                Image.asset("assets/images/icons8-comparator-96.png"),
                 Center(
                     child: new Text("Voltage: " + snapshot.data.volt , style: TitleTextStyle)),
                Image.asset("assets/images/icons8-temperature-96.png"),
                 Center(
                     child: new Text("Temperature: " + snapshot.data.temp + " °C", style: TitleTextStyle)),
                Image.asset("assets/images/icons8-information-96.png"),
                 Center(
                     child: new Text("Status", style: TitleTextStyle)),
              ]);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

}


