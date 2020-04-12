import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

extension Platform on StatelessWidget {
  bool isAndroid() {
    return defaultTargetPlatform == TargetPlatform.android;
  }
}
