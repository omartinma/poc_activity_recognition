import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_activity_recognition/activity_recognition/activity_recognition.dart';

class ActivityRecognitionView extends StatelessWidget {
  const ActivityRecognitionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: BlocBuilder<ActivityRecognitionBloc, ActivityRecognitionState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.activityEvents.length,
            itemBuilder: (context, index) {
              return ActivityTile(activity: state.activityEvents[index]);
            },
          );
        },
      ),
    );
  }
}
