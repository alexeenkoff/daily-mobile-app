import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() => ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 28, 30, 33),
    brightness: Brightness.dark,
    accentColor: Colors.white,
    primaryColor: Color.fromARGB(255, 48, 50, 55),
    backgroundColor: Color.fromARGB(255, 28, 30, 33),
    secondaryHeaderColor: Color.fromARGB(255, 153, 153, 156),
    dividerColor: Color.fromARGB(255, 77, 77, 77),
    fontFamily: 'DeJaVu',
    cupertinoOverrideTheme: CupertinoThemeData(brightness: Brightness.dark));
