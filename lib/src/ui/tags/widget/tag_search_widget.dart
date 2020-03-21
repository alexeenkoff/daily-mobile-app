import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagSearch extends StatefulWidget {
  const TagSearch(
    this._searchFun, {
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TagSearchState(_searchFun);
  final ValueChanged<String> _searchFun;
}

class TagSearchState extends State<TagSearch> {
  final ValueChanged<String> _searchFun;

  TagSearchState(this._searchFun);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 42.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.search)),
              Expanded(
                child: TextField(
                  onChanged: (string) => _searchFun(string),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 14),
                      hintText: 'Search'),
                ),
              ),
            ],
          ),
        ));
  }
}
