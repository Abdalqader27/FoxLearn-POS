import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    FutureBuilder<FirebaseApp>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return DevicePreview(enabled: false, builder: (context) => MyApp());
        return CircularProgressIndicator();
      },
    ),
  );
}
