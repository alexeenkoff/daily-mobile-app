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
  final String _text;
  AnimationController _controller;
  Animation<Color> _backgroundColorAnimation;
  Animation<Color> _textColorAnimation;
  bool _selected = true;

  _TagState(this._text) : super();

  String get text => _text;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
//    _initColors(context);
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Theme.of(context).accentColor),
              color: _backgroundAnimation(Theme.of(context)).value,
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Text(
            _text,
            style: TextStyle(color: _textAnimation(Theme.of(context)).value),
          )),
      onTap: _onWidgetClick,
    );
  }

  void _onWidgetClick() {
    _selected = !_selected;
    if (_controller.status != AnimationStatus.completed) {
      _controller.forward();
    } else
      _controller.reverse();
    developer.log('_selected = $_selected');
  }

  Animation<Color> _backgroundAnimation(ThemeData themeData) {
    if (_backgroundColorAnimation == null) {
      _backgroundColorAnimation = ColorTween(
              begin: _selected ? themeData.accentColor : themeData.backgroundColor,
              end: _selected ? themeData.backgroundColor : themeData.accentColor)
          .animate(_controller)
            ..addListener(() {
              setState(() {});
            });
    }
    return _backgroundColorAnimation;
  }

  Animation<Color> _textAnimation(ThemeData themeData) {
    if (_textColorAnimation == null) {
      _textColorAnimation = ColorTween(
              begin: _selected ? themeData.primaryColor : themeData.accentColor,
              end: _selected ? themeData.accentColor : themeData.primaryColor)
          .animate(_controller)
            ..addListener(() {
              setState(() {});
            });
    }
    return _textColorAnimation;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
