import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          'assets/images/logo_1.png',
          height: 50,
        ),
        Container(
          margin: EdgeInsets.only(left: 8),
          child: Text('daily',style: TextStyle(fontSize: 22),),
        )
      ],
    );
  }
}
