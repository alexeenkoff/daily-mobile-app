import 'package:daily_mobile_app/src/data/service/tag/tag_service.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

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
  final tagServiceRM = Injector.getAsReactive<TagService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: IntrinsicHeight(
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 64.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
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
                  WhenRebuilder<TagService>(
                    // ignore: missing_return
                    models: [tagServiceRM],
                    initState: (_, service) =>
                        service.setState((s) => s.popularTags()),
                    // ignore: missing_return
                    onIdle: () => Container(),
                    onWaiting: () => CircularProgressIndicator(),
                    onError: (error) => Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(color: Colors.blue),
                    ),
                    onData: (tagService) {
                      return StateBuilder(
                        models: [tagServiceRM],
                        builder: (_, __) {
                          return Container(
                            margin: EdgeInsets.only(top: 24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 8,
                                  runSpacing: 16,
                                  children: tagService.tags
                                      .map((tag) =>
                                          TagWidget('#' + tag.text, _onTagPress))
                                      .toList(),
//                              ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onTagPress(TagPressedResult result) {
    setState(() {
      result.checked ? _counter++ : _counter--;
      _tagCounterKey.currentState.updateCount(_counter);
    });
  }
}
