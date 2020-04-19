import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../application.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 36),
          height: 200,
          width: 200,
          child: Column(
            children: <Widget>[
              Text('Login with:'),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: RaisedButton(
                  child: Text('github'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.auth);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: RaisedButton(
                  child: Text('google'),
                ),
              ),
              Container(margin: EdgeInsets.only(top: 8), child: Text('skip'))
            ],
          ),
        ),
      ),
    );
  }
}
