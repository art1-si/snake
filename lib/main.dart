import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake/snake_game.dart';
import 'package:snake/tools/logger/logger.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const SnakeGameApp());
    },
    (error, stackTrace) => Logger.error(error.toString(), stackTrace),
  );
}
