import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatefulWidget {
  final String text;

  TagWidget(this.text, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TagState(text);
}

class _TagState extends State<TagWidget> {
  final String _text;
  bool _selected = false;

  _TagState(this._text) : super();

  void onTagClick() {
    setState(() {
      _selected = _selected ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromARGB(255, 46, 47, 52),
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Text(
          _text,
          style: TextStyle(color: Color.fromARGB(255, 247, 247, 247)),
        ));
  }
}
