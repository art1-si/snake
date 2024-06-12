import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake/snake_game_app.dart';
import 'package:snake/tools/logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(const SnakeGameApp());
    },
    (error, stackTrace) => Logger.error(error.toString(), stackTrace),
  );
}
