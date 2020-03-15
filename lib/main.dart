import 'package:daily_mobile_app/src/ui/tags/tag_counter_widget.dart';
import 'package:daily_mobile_app/src/ui/tags/tag_search_widget.dart';
import 'package:daily_mobile_app/src/ui/tags/tag_widget.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily',
      theme: appTheme(),
      home: MyHomePage(title: 'Daily'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
                  Expanded(flex: 1, child: TagCounter(_counter)),
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onTagPress(TagPressedResult result) {
    setState(() {
      result.checked ? _counter++ : _counter--;
    });
  }
}
