import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String text;

  ErrorIndicator({this.text = "Something went wrong"}): super();

  @override
  Widget build(BuildContext context) {
    return Text(this.text);
  }
}