import 'image_banner.dart';
import 'package:flutter/material.dart';
import 'package:monitordefib/text_section.dart';
import 'nav_drawer.dart';

class Connected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff0900c3),
          title: Image.asset(
            "assets/images/app_banner.png",
            fit: BoxFit.contain,
          )),
      drawer: NavDrawer(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner("assets/images/icons8-connected-256.png"),
            TextSection("Connection Status:", "Connected"),
          ]),
    );
  }
}
