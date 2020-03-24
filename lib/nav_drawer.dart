import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monitordefib/connected.dart';
import 'info.dart';
import 'home.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        AssetImage('assets/images/defibrillator_monitor.png'))),
          ),
          ListTile(
            leading: Icon(Icons.wifi),
            title: Text('Setup'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home())),
            },
          ),
          ListTile(
            leading: Icon(Icons.cached),
            title: Text('Status'),
            onTap: () => {
              Home().checkConnectivity(context),
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Info())),
            },
          ),
        ],
      ),
    );
  }
}
