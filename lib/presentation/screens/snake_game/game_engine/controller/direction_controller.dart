import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/direction.dart';

/// Controller responsible for handling the direction of the movable sprite.
///
/// It allows to change the direction of the sprite and reset it.
///
/// It has a [ValueNotifier] that notifies when the direction changes.
class DirectionController {
  DirectionController({
    Direction initialDirection = Direction.down,
  }) : _initialDirection = ConsumableDirection(initialDirection);

  final ConsumableDirection _initialDirection;

  late final directionNotifier = ValueNotifier(_initialDirection);

  ConsumableDirection get direction => directionNotifier.value;

  /// Changes the direction of the sprite.
  ///
  /// If the current direction is not consumed, it does nothing.
  /// If the new direction is the same as the current one, it does nothing.
  /// If the new direction is perpendicular to the current one, it does nothing.
  /// Otherwise, it changes the direction.
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
