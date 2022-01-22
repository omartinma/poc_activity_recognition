import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:flutter/material.dart';

extension ActivityEventX on ActivityEvent {
  IconData icon() {
    switch (type) {
      case ActivityType.IN_VEHICLE:
        return Icons.car_rental;
      case ActivityType.ON_BICYCLE:
        return Icons.pedal_bike;
      case ActivityType.ON_FOOT:
        return Icons.directions_walk;
      case ActivityType.RUNNING:
        return Icons.run_circle;
      case ActivityType.STILL:
      case ActivityType.UNKNOWN:
      case ActivityType.INVALID:
        return Icons.cancel_outlined;
      case ActivityType.TILTING:
        return Icons.redo;
      case ActivityType.WALKING:
        return Icons.directions_walk;
    }
  }
}
