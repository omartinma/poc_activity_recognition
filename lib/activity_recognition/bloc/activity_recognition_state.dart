part of 'activity_recognition_bloc.dart';

enum Status { initial, askingPermission, fetching }

class ActivityRecognitionState extends Equatable {
  const ActivityRecognitionState({
    this.activityEvents = const [],
    this.status = Status.initial,
  });

  final List<ActivityEvent> activityEvents;
  final Status status;

  ActivityRecognitionState copyWith({
    List<ActivityEvent>? activityEvents,
    Status? status,
  }) {
    return ActivityRecognitionState(
      activityEvents: activityEvents ?? this.activityEvents,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [activityEvents];
}
