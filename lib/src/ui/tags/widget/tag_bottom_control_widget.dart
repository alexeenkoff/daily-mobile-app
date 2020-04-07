import 'package:flutter/material.dart';

class TagBottomControl extends StatefulWidget {
  final VoidCallback _doneClickFun;
  final VoidCallback _onSkipClickFun;

  const TagBottomControl(
      {VoidCallback onSkipClick, VoidCallback onDoneClick, Key key})
      : this._doneClickFun = onDoneClick,
        this._onSkipClickFun = onSkipClick,
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TagBottomState();
  }
}

class _TagBottomState extends State<TagBottomControl> {
  static const String _allSetText = 'I`M ALL SET';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 22, top: 22),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(50, 28, 30, 33),
            Color.fromARGB(235, 28, 30, 33),
            Color.fromARGB(240, 28, 30, 33),
            Color.fromARGB(245, 28, 30, 33),
            Color.fromARGB(250, 28, 30, 33),
            Theme.of(context).backgroundColor
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text('skip')),
                onTap: () {
                  widget._onSkipClickFun();
                }),
          ),
          widget._doneClickFun != null
              ? Material(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    child: _allSetContainer,
                    onTap: () => widget._doneClickFun,
                  ))
              : _allSetContainer
        ],
      ),
    );
  }

  Container _allSetContainer = Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Text(_allSetText));
}
