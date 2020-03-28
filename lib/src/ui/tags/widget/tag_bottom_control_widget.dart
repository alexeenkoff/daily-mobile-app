import 'package:flutter/material.dart';

class TagBottomControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 22, top: 22),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(50, 28, 30, 33),
            Color.fromARGB(235, 28, 30, 33),
            Color.fromARGB(240, 28, 30, 33),
            Color.fromARGB(245, 28, 30, 33),
            Color.fromARGB(250, 28, 30, 33),
            Theme.of(context).backgroundColor
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text('skip')),
                onTap: () {
                  print("Skip clicked");
                }),
          ),
          Material(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: Theme.of(context).primaryColor,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Text('I`M ALL SET')),
              onTap: () {
                print("All set clicked");
              },
            ),
          )
        ],
      ),
    );
  }
}
