import 'package:permission_handler/permission_handler.dart';

/// {@template permission_client}
/// A client to handle requesting permissions on devices
/// {@endtemplate}
class PermissionClient {
  /// {@macro permission_client}
  const PermissionClient();

  /// Request access to activity recognition, just in Android
  Future<PermissionStatus> requestActivityRecognition() =>
      Permission.activityRecognition.request();
}
