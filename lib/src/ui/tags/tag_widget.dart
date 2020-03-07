import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatefulWidget {
  final String text;

  TagWidget(this.text, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TagState(text);
}

class _TagState extends State<TagWidget> with SingleTickerProviderStateMixin {
  final String _text;
  AnimationController _controller;
  Animation<Color> _selectAnimation;
  Animation<Color> _unselectAnimation;
  bool _selected = false;

  _TagState(this._text) : super();

  String get text => _text;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _selectAnimation = ColorTween(
            begin: Color.fromARGB(255, 46, 47, 52),
            end: Color.fromARGB(255, 255, 255, 255))
        .animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _unselectAnimation = ColorTween(
            begin: Color.fromARGB(255, 255, 255, 255),
            end: Color.fromARGB(255, 46, 47, 52))
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
              border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
              color: _selectAnimation.value,
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Text(
            _text,
            style: TextStyle(color: Color.fromARGB(255, 247, 247, 247)),
          )),
      onTap: _onWidgetClick,
    );
  }

  void _onWidgetClick(){
    _selected = _selected ? false : true;
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//@override
//Widget build(BuildContext context) {
//  return Container(
//      decoration: BoxDecoration(
//          shape: BoxShape.rectangle,
//          border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
//          color: Color.fromARGB(255, 46, 47, 52),
//          borderRadius: BorderRadius.all(Radius.circular(4.0))),
//      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//      child: Text(
//        _text,
//        style: TextStyle(color: Color.fromARGB(255, 247, 247, 247)),
//      ));
//}
