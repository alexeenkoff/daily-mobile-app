import 'package:flutter/services.dart';

class MagnetometerEvent {
  MagnetometerEvent(this.x, this.y, this.z);

  final double x;
  final double y;
  final double z;

  @override
  String toString() => "[Magnetometer event (x: $x, y: $y, z: $z)]";
}

const _magnitometerEventChannel =
const EventChannel('mobile.daily.dev/magnetometer');

MagnetometerEvent _listToMagnetometerEvent(List<double> list) {
  return MagnetometerEvent(list[0], list[1], list[2]);
}

Stream<MagnetometerEvent> _magnetometerEvents;

Stream<MagnetometerEvent> get magnetometerEvents {
  if (_magnetometerEvents == null) {
    _magnetometerEvents = _magnitometerEventChannel
        .receiveBroadcastStream()
        .map((dynamic event) => _listToMagnetometerEvent(event.cast<double>()));
  }
  return _magnetometerEvents;
}