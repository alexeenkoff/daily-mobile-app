import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TagExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            'TELL US WHAT YOU`RE INTO',
            style:
                TextStyle(color: Theme.of(context).accentColor, fontSize: 20),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              'Pick tags you like. We will do the rest by choosing articles for your feed based on your preferences. Make sure your select at least 5 tags. Don`t worry you can always change it later',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 14),
            ),
          ),
        )
      ],
    );
  }
}
