import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:flutter/material.dart';
import 'package:permission_client/permission_client.dart';
import 'package:poc_activity_recognition/app/app.dart';

Future<Widget> mainCommon() async {
  const permissionClient = PermissionClient();
  final activityRecognition = ActivityRecognition();
  return App(
    permissionClient: permissionClient,
    activityRecognition: activityRecognition,
  );
}
