import 'dart:async';

import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'activity_recognition_event.dart';
part 'activity_recognition_state.dart';

class ActivityRecognitionBloc
    extends Bloc<ActivityRecognitionEvent, ActivityRecognitionState> {
  ActivityRecognitionBloc(this._activityRecognition)
      : super(const ActivityRecognitionState()) {
    on<ActivityRecognitionStartedTracking>(_startedTracking);
  }

  final ActivityRecognition _activityRecognition;

  Future<FutureOr<void>> _startedTracking(
    ActivityRecognitionStartedTracking event,
    Emitter<ActivityRecognitionState> emit,
  ) async {
    await emit.forEach<ActivityEvent>(
      _activityRecognition.activityStream(),
      onData: (newActivityEvent) {
        final newEvents = List<ActivityEvent>.from(state.activityEvents)
          ..add(newActivityEvent);
        return state.copyWith(activityEvents: newEvents);
      },
    );
  }
}
