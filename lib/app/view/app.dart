// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_client/permission_client.dart';
import 'package:poc_activity_recognition/activity_recognition/activity_recognition.dart';
import 'package:poc_activity_recognition/l10n/l10n.dart';

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

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ActivityRecognitionPage(),
    );
  }
}
