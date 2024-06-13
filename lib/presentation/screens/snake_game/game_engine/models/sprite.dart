import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/direction.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/movement_behaviour.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/pixel.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/pixel_shape.dart';

/// Base class representing a sprite in the game.
///
/// It contains a list of [Pixel]s that represent the sprite.
/// It also contains a [ValueNotifier] that notifies when the pixels change.
sealed class Sprite {
  Sprite({
    required List<Pixel> pixels,
    this.shape = PixelShape.square,
  })  : pixelsNotifier = ValueNotifier(pixels),
        _initialPixels = pixels;

  final List<Pixel> _initialPixels;

  final PixelShape shape;

  final ValueNotifier<List<Pixel>> pixelsNotifier;

  List<Pixel> get pixels => pixelsNotifier.value;

  void reset() {
    pixelsNotifier.value = _initialPixels;
  }

  void respawn({
    required List<Pixel> unavailablePixelOffsets,
  }) {
    throw UnimplementedError();
  }
}

/// Class representing a sprite that cannot be moved.
class UnmovableSprite extends Sprite {
  UnmovableSprite({required super.pixels, super.shape});
}

/// Class representing a sprite that can be moved.
/// It contains a [MovementBehaviour] that defines how the sprite moves.
sealed class MovableSprite extends Sprite {
  MovableSprite({required super.pixels, required this.movementBehaviour, super.shape});

  final MovementBehaviour movementBehaviour;

  void move(Direction direction) {
    switch (movementBehaviour) {
      case MovementBehaviour.chain:
        _moveInChainBehaviour(direction);
        break;
      case MovementBehaviour.solid:
        _moveInSolidBehaviour(direction);
        break;
    }
  }

  /// Moves the sprite in a chain-like behaviour.
  void _moveInChainBehaviour(Direction direction) {
    final state = pixelsNotifier.value;
    final newHead = state.first.move(direction);
    final newPixels = state.mapIndexed((index, element) {
      if (index == 0) {
        return newHead;
      }

      return state[index - 1];
    }).toList();
    pixelsNotifier.value = newPixels;
  }

  /// Moves the sprite in a solid behaviour.
  void _moveInSolidBehaviour(Direction direction) {
    final state = pixelsNotifier.value;
    final newHead = state.first.copyWith();
    newHead.move(direction);
    final newPixels = [newHead, ...state.sublist(0, state.length - 1)];
    pixelsNotifier.value = newPixels;
  }
}

/// Class representing a sprite that moves on each tick.
class OnTickMovableSprite extends MovableSprite {
  OnTickMovableSprite({required super.pixels, required super.movementBehaviour, super.shape});
}

/// Class representing a sprite that moves on control.
class OnControlMovableSprite extends MovableSprite {
  OnControlMovableSprite({required super.pixels, required super.movementBehaviour, super.shape});
}
