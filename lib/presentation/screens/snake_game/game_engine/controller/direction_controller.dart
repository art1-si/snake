import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/widgets/direction_controls/direction_control_cluster.dart';

class DirectionController {
  DirectionController();

  final directionNotifier = ValueNotifier(Direction.down);

  Direction get direction => directionNotifier.value;

  void changeDirection(Direction direction) {
    directionNotifier.value = direction;
  }
}
