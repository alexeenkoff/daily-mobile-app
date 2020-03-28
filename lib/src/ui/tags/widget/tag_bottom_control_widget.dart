import 'package:flutter/material.dart';

class TagBottomControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: EdgeInsets.only(bottom: 22, top: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Ink(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text('skip')),
              onTap: () {
                print("Skip clicked");
              }),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Ink(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  shape: BoxShape.rectangle,
                ),
                child: Text('I`M ALL SET')),
            onTap: () {
              print("All set clicked");
            },
          )
        ],
      ),
    );
  }
}
