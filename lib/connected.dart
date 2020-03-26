import 'image_banner.dart';
import 'package:flutter/material.dart';
import 'package:monitordefib/text_section.dart';
import 'nav_drawer.dart';
import 'data.dart';
import 'style.dart';

class Connected extends StatelessWidget {
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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            ImageBanner("assets/images/icons8-connected-256.png"),
            const SizedBox(height: 40),
            const SizedBox(height: 40),
            Center(
                child: new Text("Connected to the Monitor",
                    style: TitleTextStyle)),
            const SizedBox(height: 40),
            const SizedBox(height: 40),
            new SizedBox(
              width: 220.0,
              height: 50.0,
              child: new RaisedButton(
                color: Colors.lightBlueAccent,
                child: new Text(
                  'Fetch Data',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FetchData()),
                  );
                },
              ),
            ),
          ]),
    );
  }
}

Future<bool> _getFutureBool() {
  return Future.delayed(Duration(milliseconds: 500)).then((onValue) => true);
}
