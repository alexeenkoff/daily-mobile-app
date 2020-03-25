import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DailyProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return defaultTargetPlatform == TargetPlatform.android
        ? CircularProgressIndicator()
        : CupertinoActivityIndicator();
  }
}
