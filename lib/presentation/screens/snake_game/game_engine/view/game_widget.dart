import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/controller/direction_controller.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/controller/gameplay_controller.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/canvas_pixel_density.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/game_play_event.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/view/game_canvas.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/sprite.dart';

abstract class GameWidget extends StatefulWidget {
  const GameWidget({
    super.key,
    required this.pixelDensity,
    required this.directionController,
    required this.gameplayController,
  });

  final DirectionController directionController;

  final CanvasPixelDensity pixelDensity;

  final GameplayController gameplayController;

  void onCollisionWithOtherSprite(Sprite sprite1, Sprite sprite2);

  void onCollisionWithWall(Sprite sprite);

  void onCollisionWithItself(Sprite sprite);

  List<Sprite> spriteBuilder();

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  late final List<Sprite> _sprites = widget.spriteBuilder();

  @override
  void initState() {
    super.initState();
    widget.gameplayController.addListener(gameplayControllerListener);
  }

  @override
  void dispose() {
    widget.gameplayController.removeListener(gameplayControllerListener);
    widget.gameplayController.dispose();
    super.dispose();
  }

  void gameplayControllerListener(GameplayEvents event) {
    if (event is TickerEvent) {
      onTick();
    }
    if (event is StartGame) {
      resetGameplay();
    }
  }

  void resetGameplay() {
    widget.directionController.reset();
    for (var element in _sprites) {
      element.reset();
    }
  }

  void onTick() {
    for (var element in _sprites) {
      if (element is MovableSprite) {
        element.move(widget.directionController.direction.direction);
        widget.directionController.direction.consume();
      }
    }
    checkForCollision();
  }

  void checkForCollision() {
    final collidedWithWallSprite = _collidedWithWall();
    if (collidedWithWallSprite != null) {
      widget.onCollisionWithWall(collidedWithWallSprite);
      return;
    }

    final collidedWithOtherSprite = _collidedWithOtherSprite();
    if (collidedWithOtherSprite != null) {
      widget.onCollisionWithOtherSprite(collidedWithOtherSprite.$1, collidedWithOtherSprite.$2);
      return;
    }

    final collidedWithItselfSprite = _collidedWithItself();
    if (collidedWithItselfSprite != null) {
      widget.onCollisionWithItself(collidedWithItselfSprite);
      return;
    }
  }

  Sprite? _collidedWithItself() {
    for (var sprite in _sprites) {
      for (var pixel in sprite.pixels) {
        if (sprite.pixels.where((element) => element.offset == pixel.offset).length > 1) {
          return sprite;
        }
      }
    }
    return null;
  }

  (Sprite sprite1, Sprite sprite2)? _collidedWithOtherSprite() {
    for (var sprite1 in _sprites) {
      for (var sprite2 in _sprites) {
        if (sprite1 == sprite2) {
          continue;
        }

        for (var pixel1 in sprite1.pixels) {
          for (var pixel2 in sprite2.pixels) {
            if (pixel1.offset == pixel2.offset) {
              return (sprite1, sprite2);
            }
          }
        }
      }
    }
    return null;
  }

  Sprite? _collidedWithWall() {
    for (var sprite in _sprites) {
      for (var pixel in sprite.pixels) {
        if (pixel.offset.x < 0 || pixel.offset.x >= widget.pixelDensity.pixelDensity) {
          return sprite;
        }

        if (pixel.offset.y < 0 || pixel.offset.y >= widget.pixelDensity.pixelDensity) {
          return sprite;
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GameCanvas(
      sprite: _sprites,
      pixelDensity: widget.pixelDensity,
      animationDuration: widget.gameplayController.tickerSpeed.inMilliseconds > 250
          ? const Duration(milliseconds: 250)
          : widget.gameplayController.tickerSpeed,
    );
  }
}
