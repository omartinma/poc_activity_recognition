import 'dart:async';
import 'dart:io';

import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:permission_client/permission_client.dart';
import 'package:permission_handler/permission_handler.dart';

part 'activity_recognition_event.dart';
part 'activity_recognition_state.dart';

class ActivityRecognitionBloc
    extends Bloc<ActivityRecognitionEvent, ActivityRecognitionState> {
  ActivityRecognitionBloc(this._activityRecognition, this._permissionClient)
      : super(const ActivityRecognitionState()) {
    on<ActivityRecognitionStartedTracking>(_startedTracking);
  }

  final ActivityRecognition _activityRecognition;
  final PermissionClient _permissionClient;

  Future<void> _startedTracking(
    ActivityRecognitionStartedTracking event,
    Emitter<ActivityRecognitionState> emit,
  ) async {
    // We need to ask permission just in Android
    if (Platform.isAndroid) {
      emit(state.copyWith(status: Status.askingPermission));
      if (!await _permissionClient.requestActivityRecognition().isGranted) {
        return;
      }
    }
    emit(state.copyWith(status: Status.fetching));
    await emit.forEach<ActivityEvent>(
      _activityRecognition.activityStream(),
      onData: (newActivityEvent) {
        final newEvents = List<ActivityEvent>.from(
          <ActivityEvent>[newActivityEvent, ...state.activityEvents],
        );
        return state.copyWith(activityEvents: newEvents);
      },
    );
  }
}
