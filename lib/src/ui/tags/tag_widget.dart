import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class TagWidget extends StatefulWidget {
  final String text;

  TagWidget(this.text, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TagState(text);
}

class _TagState extends State<TagWidget> with SingleTickerProviderStateMixin {
  final white = Color.fromARGB(255, 255, 255, 255);
  final dark = Color.fromARGB(255, 46, 47, 52);
  final String _text;
  AnimationController _controller;
  Animation<Color> _backgroundColorAnimation;
  Animation<Color> _textColorAnimation;
  bool _selected = false;

  _TagState(this._text) : super();

  String get text => _text;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
    _backgroundColorAnimation = ColorTween(
            begin: _selected ? white : dark, end: _selected ? dark : white)
        .animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _textColorAnimation = ColorTween(
            begin: _selected ? dark : white, end: _selected ? white : dark)
        .animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: white),
              color: _backgroundColorAnimation.value,
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Text(
            _text,
            style: TextStyle(color: _textColorAnimation.value),
          )),
      onTap: _onWidgetClick,
    );
  }

  void _onWidgetClick() {
    _selected = _selected ? false : true;

    developer.log('_selected = $_selected');
    if (_selected) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
