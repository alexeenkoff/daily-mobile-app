import 'package:daily_mobile_app/main.dart';
import 'package:daily_mobile_app/src/ui/tags/tags_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'src/ui/app_theme.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [],
        builder: (_) => MaterialApp(
              title: 'Daily',
              theme: appTheme(),
              routes: {Routes.tags: (context) => TagsPage()},
            ));
  }
}

class Routes {
  static final tags = '/';
}
