import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagCounter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TagCounterState();
}

class TagCounterState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color.fromARGB(255, 48, 50, 55),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Text(
        '0/5',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
