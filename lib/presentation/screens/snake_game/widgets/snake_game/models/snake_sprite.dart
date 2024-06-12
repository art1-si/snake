import 'package:snake/presentation/screens/snake_game/game_engine/models/movement_behaviour.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/pixel.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/sprite.dart';
import 'package:snake/presentation/theme/app_colors.dart';

class SnakeSprite extends OnTickMovableSprite {
  SnakeSprite({required super.pixels}) : super(movementBehaviour: MovementBehaviour.chain);

  factory SnakeSprite.fromLength(int length) {
    return SnakeSprite(
      pixels: List.generate(
        length,
        (index) => Pixel(
          offset: PixelOffset(x: 0, y: index),
          color: AppColors.onBackground,
        ),
      ).reversed.toList(),
    );
  }

  void grow() {
    final state = pixelsNotifier.value;
    final lastPixel = state.last;
    final newPixel = lastPixel.copyWith();
    pixelsNotifier.value = [...state, newPixel];
  }
}
