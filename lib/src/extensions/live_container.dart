import 'package:flutter/cupertino.dart';
import 'package:daily_mobile_app/src/extensions/magnetometer.dart';

class Margins {
  double top = 0, bottom = 0, left = 0, right = 0;
}

class LiveContainer extends StatefulWidget {
  LiveContainer({this.child, this.velocity = 1.0}): super();

  final Widget child;
  final double velocity;

  @override
  State<StatefulWidget> createState() => _LiveContainerState(child, velocity);
}

class _LiveContainerState extends State<LiveContainer> {
  _LiveContainerState(this.child, this.velocity): super();

  final Widget child;
  final double velocity;
  Margins margins = Margins();
  static const inf = -10000000000000.0;
  MagnetometerEvent magnetometerData = MagnetometerEvent(inf, inf, inf);
  MagnetometerEvent magnetometerOffset = MagnetometerEvent(inf, inf, inf);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.only(
        top: margins.top,
        bottom: margins.bottom,
        left: margins.left,
        right: margins.right,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    magnetometerEvents.listen((MagnetometerEvent event) {
      setState(() {
        magnetometerData = event;

        if (magnetometerOffset.x != inf) {
          final offsetX = velocity * (event.x - magnetometerOffset.x);
          final offsetY = velocity * (event.y - magnetometerOffset.y);
          if (offsetX < 0) {
            margins.left = 0;
            margins.right = offsetX.abs();
          } else {
            margins.left = offsetX;
            margins.right = 0;
          }
          if (offsetY < 0) {
            margins.top = offsetY.abs();
            margins.bottom = 0;
          } else {
            margins.top = 0;
            margins.bottom = offsetY;
          }
        } else {
          magnetometerOffset = event;
        }
      });
    });
  }
}