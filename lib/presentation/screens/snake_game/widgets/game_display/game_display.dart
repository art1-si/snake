import 'package:snake/presentation/screens/snake_game/difficulty_level/model/difficulty_level.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/sprite.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/view/game_widget.dart';
import 'package:snake/presentation/screens/snake_game/widgets/game_display/models/apple_sprite.dart';
import 'package:snake/presentation/screens/snake_game/widgets/game_display/models/snake_sprite.dart';

class SnakeGame extends GameWidget {
  SnakeGame({
    super.key,
    required DifficultyLevel difficultyLevel,
    required super.directionController,
  }) : super(
          pixelDensity: difficultyLevel.pixelDensity,
        );

  @override
  void onCollisionWithOtherSprite(Sprite sprite1, Sprite sprite2) {
    if (sprite1 == sprite2) {
      //TODO(Artur):handle collision on itself
      return;
    }
  }

  @override
  void onCollisionWithItself(Sprite sprite) {
    // TODO: implement onCollisionWithItself
  }

  @override
  void onCollisionWithWall(Sprite sprite) {
    // TODO: implement onCollisionWithWall
  }

  @override
  List<Sprite> spriteBuilder() {
    return [
      SnakeSprite.fromLength(4),
      AppleSprite.random(pixelDensity: pixelDensity),
    ];
  }
}
