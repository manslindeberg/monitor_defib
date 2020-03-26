import 'image_banner.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:monitordefib/text_section.dart';
import 'nav_drawer.dart';

class NotConnected extends StatelessWidget {
  String flag;

  NotConnected(this.flag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xff6807f9),

        title: Image.asset("assets/images/app_banner.png")
      ),
      backgroundColor: Color(0xffe6e6fa),
      drawer: NavDrawer(),
      body:
      Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            ImageBanner("assets/images/icons8-disconnected-256.png"),
            const SizedBox(height: 40),
            TextSection("You're connected to " + flag + " network",
                "Please connect to the correct Acesspoint and try again."),
            const SizedBox(height: 40),
            new SizedBox(
              width: 220.0,
              height: 50.0,
              child: new RaisedButton(
                color: Colors.lightBlueAccent,
                child: new Text('Try Again',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                onPressed: (){
                  Home().checkConnectivity(context);
                },
              ),
            ),


          ]),
    );
  }
}
