import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagCounter extends StatefulWidget {
  final int _count;

  TagCounter(this._count, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TagCounterState();
}

class TagCounterState extends State<TagCounter> {
  final _max = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Text(
        '${widget._count}/$_max',
        style: TextStyle(color: Theme.of(context).accentColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
