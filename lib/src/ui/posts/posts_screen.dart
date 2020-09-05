import 'package:daily_mobile_app/src/data/service/posts/posts_service.dart';
import 'package:daily_mobile_app/src/ui/common/progress_indicator.dart';
import 'package:daily_mobile_app/src/ui/posts/widget/posts_appbar.dart';
import 'package:daily_mobile_app/src/ui/posts/widget/posts_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final ReactiveModel<PostsService> postsServiceRM =
      Injector.getAsReactive<PostsService>();
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        postsServiceRM.setState((service) => service.loadNextPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostsAppBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: WhenRebuilder<PostsService>(
            models: [postsServiceRM],
            initState: (_, service) => service.setState((s) => s.initState()),
            // ignore: missing_return
            onIdle: (() => Container()),
            //TODO
            // ignore: missing_return
            onWaiting: (() => DailyProgressIndicator()),
            // ignore: missing_return
            onError: ((_) => Container()),
            //TODO
            onData: ((service) => ListView.separated(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: postsServiceRM.value.posts.length,
                  itemBuilder: (context, index) {
                    return PostsItem(postsServiceRM.value.posts[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Padding(padding: EdgeInsets.only(top: 15),),
                  controller: _controller,
                )),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
