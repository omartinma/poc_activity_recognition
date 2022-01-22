part of 'activity_recognition_bloc.dart';

@immutable
abstract class ActivityRecognitionEvent extends Equatable {
  const ActivityRecognitionEvent();
}

class ActivityRecognitionStartedTracking extends ActivityRecognitionEvent {
  const ActivityRecognitionStartedTracking();

  @override
  List<Object?> get props => [];
}
