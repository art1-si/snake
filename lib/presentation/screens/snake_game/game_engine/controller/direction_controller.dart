import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/direction_controls/direction_control_cluster.dart';

class ConsumableDirection {
  ConsumableDirection(this.direction);

  void consume() {
    if (_consumed) {
      return;
    }
    _consumed = true;
  }

  final Direction direction;
  bool _consumed = false;

  bool get isConsumed => _consumed;
}

class DirectionController {
  DirectionController({
    Direction initialDirection = Direction.down,
  }) : _initialDirection = ConsumableDirection(initialDirection);

  final ConsumableDirection _initialDirection;

  late final directionNotifier = ValueNotifier(_initialDirection);

  ConsumableDirection get direction => directionNotifier.value;

  void changeDirection(Direction newDirection) {
    if (!direction.isConsumed) {
      return;
    }

    if (newDirection.isHorizontal == direction.direction.isHorizontal) {
      return;
    }
    if (newDirection.isVertical == direction.direction.isVertical) {
      return;
    }
    directionNotifier.value = ConsumableDirection(newDirection);
  }

  void reset() {
    directionNotifier.value = _initialDirection;
  }

  void dispose() {
    directionNotifier.dispose();
  }
}
