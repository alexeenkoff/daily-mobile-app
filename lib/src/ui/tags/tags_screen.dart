import 'package:flutter/material.dart';

import 'widget/tag_counter_widget.dart';
import 'widget/tag_search_widget.dart';
import 'widget/tag_widget.dart';

class TagsPage extends StatefulWidget {
  TagsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  int _counter = 0;
  GlobalKey<TagCounterState> _tagCounterKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: IntrinsicHeight(
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 64.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(flex: 1, child: TagCounter(key: _tagCounterKey)),
                  Container(margin: EdgeInsets.only(left: 8, right: 8)),
                  Expanded(flex: 4, child: TagSearch())
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
//            ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: <Widget>[
                        TagWidget('#android-development', _onTagPress),
                        TagWidget('#iOS-development', _onTagPress),
                        TagWidget('#flutter-development', _onTagPress),
                        TagWidget('#news', _onTagPress),
                        TagWidget('#kubernetes', _onTagPress),
                        TagWidget('#tech', _onTagPress),
                        TagWidget('#ai', _onTagPress),
                        TagWidget('#webdev', _onTagPress),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onTagPress(TagPressedResult result) {
    setState(() {
      result.checked ? _counter++ : _counter--;
      _tagCounterKey.currentState.updateCount(_counter);
    });
  }
}
