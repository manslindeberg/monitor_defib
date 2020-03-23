import 'connected.dart';
import 'not_connected.dart';
import 'package:flutter/material.dart';
import 'style.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      home: NotConnected("defib_monitor"),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(title: AppBarTextStyle)

        ),
        textTheme: TextTheme(
          title: TitleTextStyle,
          body1: Body1TextStyle,
        )
      )
    );
  }
}