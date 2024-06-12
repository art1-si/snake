import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/widgets/direction_controls/direction_control_cluster.dart';

class DirectionController {
  DirectionController({
    Direction initialDirection = Direction.down,
  }) : _initialDirection = initialDirection;

  final Direction _initialDirection;

  late final directionNotifier = ValueNotifier(_initialDirection);

  Direction get direction => directionNotifier.value;

  void changeDirection(Direction direction) {
    directionNotifier.value = direction;
  }

  void reset() {
    directionNotifier.value = _initialDirection;
  }
}
