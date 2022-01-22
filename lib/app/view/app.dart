import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_client/permission_client.dart';
import 'package:poc_activity_recognition/app/app.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required PermissionClient permissionClient,
    required ActivityRecognition activityRecognition,
  })  : _permissionClient = permissionClient,
        _activityRecognition = activityRecognition,
        super(key: key);

  final PermissionClient _permissionClient;
  final ActivityRecognition _activityRecognition;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _permissionClient),
        RepositoryProvider.value(value: _activityRecognition),
      ],
      child: const AppView(),
    );
  }
}
