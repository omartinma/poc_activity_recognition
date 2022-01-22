// ignore_for_file: prefer_const_constructors

import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_client/permission_client.dart';
import 'package:poc_activity_recognition/app/app.dart';

import '../../helpers/pump_app.dart';

class MockPermissionClient extends Mock implements PermissionClient {}

class MockActivityRecognition extends Mock implements ActivityRecognition {}

void main() {
  group('App', () {
    late PermissionClient permissionClient;
    late ActivityRecognition activityRecognition;

    setUp(() {
      permissionClient = MockPermissionClient();
      activityRecognition = MockActivityRecognition();
      when(() => activityRecognition.activityStream())
          .thenAnswer((_) => Stream.empty());
    });

    testWidgets('renders AppView', (tester) async {
      await tester.pumpApp(
        App(
          activityRecognition: activityRecognition,
          permissionClient: permissionClient,
        ),
      );
      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
