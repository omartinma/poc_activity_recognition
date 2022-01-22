import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:flutter/material.dart';
import 'package:poc_activity_recognition/activity_recognition/activity_recognition.dart';

class ActivityTile extends StatelessWidget {
  const ActivityTile({Key? key, required this.activity, required this.first})
      : super(key: key);

  final ActivityEvent activity;
  final bool first;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: first ? Colors.green : Colors.transparent,
      leading: Icon(activity.icon()),
      title: Text(
        '${activity.type.toString().split('.').last} (${activity.confidence}%)',
      ),
      trailing:
          Text(activity.timeStamp.toString().split(' ').last.split('.').first),
    );
  }
}
