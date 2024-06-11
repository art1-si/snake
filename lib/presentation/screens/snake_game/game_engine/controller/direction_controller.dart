import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/widgets/game_controller/direction_controls.dart';

class DirectionController {
  DirectionController();

  final directionNotifier = ValueNotifier(Direction.down);

  Direction get direction => directionNotifier.value;

  void changeDirection(Direction direction) {
    directionNotifier.value = direction;
  }
}
