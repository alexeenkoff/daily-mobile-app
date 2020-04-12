import 'package:daily_mobile_app/src/ui/common/posts_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostsAppBar(),
      body: Container(),
    );
    ;
  }
}
