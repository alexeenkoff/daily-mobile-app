import 'dart:async';

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
  final _searchController = TextEditingController();
  Timer _debounce;
  String _searchText = '';

  TagSearchState(this._searchFun);

  @override
  void initState() {
    _searchController.addListener(_searchListener);
    super.initState();
  }

  _searchListener() {
    if (_searchController.value.text != _searchText) {
      _searchText = _searchController.text;
      if (_debounce?.isActive ?? false) _debounce.cancel();
      _debounce = Timer(const Duration(milliseconds: 1000), () {
        _searchFun(_searchText);
      });
    }
  }

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
                  controller: _searchController,
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

  @override
  void dispose() {
    _searchController.removeListener(_searchListener);
    _searchController.dispose();
    super.dispose();
  }
}
