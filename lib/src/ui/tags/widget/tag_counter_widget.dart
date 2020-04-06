import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagCounter extends StatelessWidget {
  final int max;
  final int count;

  TagCounter({Key key, this.count = 0, this.max = 5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Text(
        '$count/$max',
        style: TextStyle(color: Theme.of(context).accentColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
