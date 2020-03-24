

import 'package:flutter/material.dart';

class ButtonBanner extends StatelessWidget {
  final String _text;

  ButtonBanner(this._text) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
        height: 40.0,
          width: 30.0,
        ),
        child : RaisedButton(
            onPressed: () {},
            child: Text(_text),
    ),
    );
  }
}
