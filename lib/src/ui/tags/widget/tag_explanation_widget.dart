import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagExplanationTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'TELL US WHAT YOU`RE INTO',
        style: TextStyle(color: Theme.of(context).accentColor, fontStyle: FontStyle.italic, fontSize: 20),
      ),
    );
  }
}

class TagExplanationText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pick tags you like. We will do the rest by choosing articles for your feed based on your preferences. Make sure your select at least 5 tags. Don`t worry you can always change it later',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontStyle: FontStyle.italic,
            fontSize: 14),
      ),
    );
  }
}
