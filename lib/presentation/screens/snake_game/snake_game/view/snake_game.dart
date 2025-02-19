import 'dart:ui';

import 'package:snake/presentation/shared/difficulty_level/model/difficulty_level.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/sprite.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/view/game_widget.dart';
import 'package:snake/presentation/screens/snake_game/snake_game/models/apple_sprite.dart';
import 'package:snake/presentation/screens/snake_game/snake_game/models/snake_sprite.dart';

class SnakeGame extends GameWidget {
  SnakeGame({
    super.key,
    required DifficultyLevel difficultyLevel,
    required super.directionController,
    required super.gameplayController,
    this.onAppleEaten,
  }) : super(
          pixelDensity: difficultyLevel.pixelDensity,
        );

  final VoidCallback? onAppleEaten;

  @override
  void onCollisionWithOtherSprite(Sprite sprite1, Sprite sprite2) {
    if (sprite1 is SnakeSprite && sprite2 is AppleSprite) {
      sprite1.grow();
      sprite2.respawn(unavailablePixelOffsets: sprite1.pixels);
      onAppleEaten?.call();
    }
    return;
  }

  @override
  void onCollisionWithItself(Sprite sprite) {
    gameplayController.endGame();
  }

  @override
  void onCollisionWithWall(Sprite sprite) {
    gameplayController.endGame();
  }

  @override
  List<Sprite> spriteBuilder() {
    final snakeSprite = SnakeSprite.fromLength(4);
    return [
      snakeSprite,
      AppleSprite.random(pixelDensity: pixelDensity, unavailablePixelOffsets: snakeSprite.pixels),
    ];
  }
}
