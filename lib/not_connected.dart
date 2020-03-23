

//import 'package:connectivity/connectivity.dart';
//import 'package:monitordefib/connected.dart';

import 'image_banner.dart';
import 'package:flutter/material.dart';
import 'package:monitordefib/text_section.dart';

class NotConnected extends StatelessWidget {
  @override
  var _wifiname;

  NotConnected(this._wifiname);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Defibrilator Monitor'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner("assets/images/icons8-wi-fi-disconnected-512.png"),
            RaisedButton(child: Text("Check Connectivity"), onPressed: null),
            TextSection(
                "Setup",
                "In order to setup a connection to the"
                    "monitor, you need to connect to the Wifi:"
                    "\r\n"
                    "\r\n Name:         defib_monitor"
                    "\r\n Password:   heartsavior "),
          ]),
    );
  }

 /* _checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
    } else if (result == ConnectivityResult.wifi) {
      var wifiName = await (Connectivity().getWifiName());
      var wifiIP = await (Connectivity().getWifiIP());

      _wifiname = Connectivity().getWifiName();
    }
  }*/
}
