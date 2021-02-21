import 'package:daily_mobile_app/src/extensions/live_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreenDesign extends StatefulWidget {
  @override
  _LoginScreenDesignState createState() => _LoginScreenDesignState();
}

class _LoginScreenDesignState extends State<LoginScreenDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 128.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/logo@3x.png", height: 117)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LiveContainer(
                    child: Image.asset("assets/images/shapes.png"),
                    velocity: 0.4,
                  )
                ],
              ),
            ),
            Positioned(
              right: -50,
              child: Container(
                margin: EdgeInsets.only(top: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    LiveContainer(
                        child: Transform.rotate(
                      angle: 1,
                      child: Image.asset(
                        "assets/images/yellow_arrow.png",
                        height: 160,
                      ),
                    ), velocity: 0.6,)
                  ],
                ),
              ),
            ),
            Positioned(
              left: -70,
              bottom: -110,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    LiveContainer(
                      child: Transform.rotate(
                        angle: -0.13,
                        child: Image.asset(
                          "assets/images/blue_arrow.png",
                          height: 250,
                        ),
                      ), velocity: 0.6,)
                  ],
                ),
              ),
            ),
            Positioned(
              left: -270,
              child: Container(
                child: LiveContainer(
                  child: Transform.rotate(
                    angle: 0,
                    child: Image.asset(
                      "assets/images/blue_line.png",
                      height: 300,
                    ),
                  ), velocity: 0.6,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LiveContainer(
                    child: Transform.rotate(
                      angle: 0.1,
                      child: Image.asset(
                        "assets/images/yellow_arrow.png",
                        height: 40,
                      ),
                    ), velocity: 0.6,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 160),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 40),
                            child: Text("Sign in to Daily"),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 130,
                                height: 54,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 3, 102, 214),
                                    borderRadius: BorderRadius.all(Radius.circular(30))
                                ),
                                child: Center(child: Image.asset("assets/images/github@3x.png", height: 30,)),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Text("or", style: TextStyle(fontSize: 12),),
                              ),
                              Container(
                                width: 130,
                                height: 54,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 219, 68, 55),
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                                child: Center(child: Image.asset("assets/images/google@3x.png", height: 30,),),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("skip", style: TextStyle(color: Color.fromARGB(255, 0, 122, 155)),),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
