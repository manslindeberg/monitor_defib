import 'package:connectivity/connectivity.dart';
import 'package:monitordefib/connected.dart';
import 'image_banner.dart';
import 'package:flutter/material.dart';
import 'package:monitordefib/text_section.dart';
import 'not_connected.dart';
import 'nav_drawer.dart';

class Home extends StatelessWidget {
  var wifiBSSID;
  var wifiIP;
  var wifiName;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff0900c3),
          title: Image.asset(
            "assets/images/app_banner.png",
            fit: BoxFit.contain,
          )),
      drawer: NavDrawer(),
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageBanner("assets/images/icons8-information-256.png"),
            TextSection(
                "Setup",
                "In order to setup a connection to the"
                    " monitor, you need to connect to the Access Point:"
                    "\r\n"
                    "\r\n"
                    "\r\n Name:          Arduino"
                    "\r\n Password:   arduino"),
            const SizedBox(height: 40),
            new SizedBox(
              width: 220.0,
              height: 50.0,
              child: new RaisedButton(
                color: Color(0xff0075f6),
                child: new Text(
                  'Check Connectivity',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  checkConnectivity(context);
                },
              ),
            ),
          ]),
    );
  }

  checkConnectivity(BuildContext context) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotConnected("none")),
      );
    }

    if (result == ConnectivityResult.mobile) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotConnected("mobile")),
      );
    }

    if (result == ConnectivityResult.wifi) {
      wifiBSSID = await (Connectivity().getWifiBSSID());
      wifiIP = await (Connectivity().getWifiIP());
      wifiName = await (Connectivity().getWifiName());

      if (wifiIP.toString().compareTo("192.168.10.209") == 0) {
        // Connected to the correct network
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Connected()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NotConnected(wifiIP.toString())),
        );
      }
    }
  }
}
