import 'package:daily_mobile_app/src/data/service/posts/posts_service.dart';
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
      body: Container(),
    );
  }
}
