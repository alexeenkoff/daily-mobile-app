import 'package:daily_mobile_app/src/data/service/posts/posts_service.dart';
import 'package:daily_mobile_app/src/ui/common/progress_indicator.dart';
import 'package:daily_mobile_app/src/ui/posts/widget/posts_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final ReactiveModel<PostsService> postsServiceRM =
      Injector.getAsReactive<PostsService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostsAppBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 64.0),
          child: WhenRebuilder<PostsService>(
            models: [postsServiceRM],
            initState: (_, service) => service.setState((s) => s.initState()),
            // ignore: missing_return
            onIdle: (() => Container()),
            // ignore: missing_return
            onWaiting: (() => DailyProgressIndicator()),
            // ignore: missing_return
            onError: ((_) => Container()),
            // ignore: missing_return
            onData: ((_) => Container()),
          ),
        ),
      ),
    );
  }
}
