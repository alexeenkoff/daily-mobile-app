import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PostsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final _widget = AppBar(
    elevation: defaultTargetPlatform == TargetPlatform.android ? 4.0 : 0,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          'assets/images/logo_small.png',
          height: 50,
        ),
        Container(
          margin: EdgeInsets.only(left: 8),
          child: Text(
            'daily',
            style: TextStyle(fontSize: 22),
          ),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _widget;
  }

  @override
  Size get preferredSize => _widget.preferredSize;
}
