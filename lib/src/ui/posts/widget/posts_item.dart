import 'package:daily_mobile_app/src/domain/entities/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostsItem extends StatelessWidget {
  final Post _post;

  const PostsItem(this._post, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 295,
//        child: ListTile(title: Text(_post.title)));
        child: Column(children: [
          Placeholder(
            fallbackHeight: 100,
            color: Theme.of(context).accentColor,
          ),
          ListTile(title: Text(_post.title)),
        ]));
  }
}
