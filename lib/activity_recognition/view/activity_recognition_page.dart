import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_client/permission_client.dart';
import 'package:poc_activity_recognition/activity_recognition/activity_recognition.dart';

class ActivityRecognitionPage extends StatelessWidget {
  const ActivityRecognitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityRecognitionBloc(
        context.read<ActivityRecognition>(),
        context.read<PermissionClient>(),
      )..add(const ActivityRecognitionStartedTracking()),
      child: const ActivityRecognitionView(),
    );
  }
}
