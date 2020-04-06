import 'package:daily_mobile_app/src/data/service/tag/tag_service.dart';
import 'package:daily_mobile_app/src/ui/common/progress_indicator.dart';
import 'package:daily_mobile_app/src/ui/tags/widget/tag_bottom_control_widget.dart';
import 'package:daily_mobile_app/src/ui/tags/widget/tag_explanation_widget.dart';
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
  final ReactiveModel<TagService> tagServiceRM = Injector.getAsReactive<TagService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 64.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TagExplanationTitle(),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    StateBuilder(
                      models: [tagServiceRM],
                      builder: (context, _) {
                        int selectedCount = tagServiceRM.state.selectedTags?.length ?? 0;
                        return Expanded(
                          flex: 1,
                          child: TagCounter(
                            key: Key('tagCounter $selectedCount'),
                            count: selectedCount,
                          ),
                        );
                      },
                    ),
                    Container(margin: EdgeInsets.only(left: 8, right: 8)),
                    Expanded(
                      flex: 4,
                      child: TagSearch(
                        (query) => tagServiceRM.setState(
                          (state) => state.loadTags(query)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  WhenRebuilder<TagService>(
                    // ignore: missing_return
                    models: [tagServiceRM],
                    initState: (_, service) =>
                        service.setState((s) => s.initState()),
                    // ignore: missing_return
                    onIdle: () => Container(),
                    onWaiting: () => Center(child: DailyProgressIndicator()),
                    onError: (error) => Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(color: Colors.blue),
                    ),
                    onData: (tagService) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 82),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 8,
                            runSpacing: 16,
                            children: _content(tagService),
                          ),
                        ),
                      );
                    },
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: TagBottomControl())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _content(TagService tagService) {
    List<Widget> tags = tagService.tags
        .map((tag) => TagWidget('#' + tag.text, tag.isChecked, _onTagPress))
        .toList();
    return [
      if (tagService.needShowExplanation) TagExplanationText(),
      ...tags,
    ];
  }

  _onTagPress(TagPressedResult result) {
    tagServiceRM.setState((state) => state.onTagClick(result.text, result.checked));
  }
}
