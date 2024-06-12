import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/movement_behaviour.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/pixel.dart';
import 'package:snake/presentation/screens/snake_game/widgets/direction_controls/direction_control_cluster.dart';
import 'package:snake/tools/logger/logger.dart';

sealed class Sprite {
  Sprite({
    required List<Pixel> pixels,
  })  : pixelsNotifier = ValueNotifier(pixels),
        _initialPixels = pixels;

  final List<Pixel> _initialPixels;

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

class UnmovableSprite extends Sprite {
  UnmovableSprite({required super.pixels});
}

sealed class MovableSprite extends Sprite {
  MovableSprite({required super.pixels, required this.movementBehaviour});

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

  void _moveInChainBehaviour(Direction direction) {
    final state = pixelsNotifier.value;
    final newHead = state.first.move(direction);
    final newPixels = state.mapIndexed((index, element) {
      if (index == 0) {
        return newHead;
      }

      return state[index - 1];
    }).toList();
    Logger.debug('newPixels: $newPixels');
    pixelsNotifier.value = newPixels;
  }

  void _moveInSolidBehaviour(Direction direction) {
    final state = pixelsNotifier.value;
    final newHead = state.first.copyWith();
    newHead.move(direction);
    final newPixels = [newHead, ...state.sublist(0, state.length - 1)];
    pixelsNotifier.value = newPixels;
  }
}

class OnTickMovableSprite extends MovableSprite {
  OnTickMovableSprite({required super.pixels, required super.movementBehaviour});
}

class OnControlMovableSprite extends MovableSprite {
  OnControlMovableSprite({required super.pixels, required super.movementBehaviour});
}
