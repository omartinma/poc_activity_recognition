part of 'activity_recognition_bloc.dart';

class ActivityRecognitionState extends Equatable {
  const ActivityRecognitionState({
    this.activityEvents = const [],
  });

  final List<ActivityEvent> activityEvents;

  ActivityRecognitionState copyWith({
    List<ActivityEvent>? activityEvents,
  }) {
    return ActivityRecognitionState(
      activityEvents: activityEvents ?? this.activityEvents,
    );
  }

  @override
  List<Object?> get props => [activityEvents];
}
