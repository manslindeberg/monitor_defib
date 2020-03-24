import 'package:monitordefib/nav_drawer.dart';

import 'image_banner.dart';
import 'package:flutter/material.dart';
import 'package:monitordefib/text_section.dart';

class Info extends StatelessWidget {
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
            ImageBanner("assets/images/defibrillator_monitor.png"),
            TextSection("About", "Defibrillator Monitor is a project"
                "made by four students at the faculty of Electrical engineering"
                " at Lund University."
                "\r\n"
                "\r\n"
                "The purpose of this app is to gain"
                "necessary information about the status of your prefered "
                "defibrillator, in order for it to work properly when needed"
                "\r\n"
                "\r\n"
                " The contributors of this project are Axel Sneitz-Björkman, Ludvig Hansson"
                "Måns Lindeberg and Oskar Nilveus Olofsson"),
          ]),
    );
  }
}
