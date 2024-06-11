import 'dart:math';

import 'package:snake/presentation/screens/snake_game/game_engine/models/canvas_pixel_density.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/pixel.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/sprite.dart';
import 'package:snake/presentation/theme/app_colors.dart';

class AppleSprite extends UnmovableSprite {
  const AppleSprite({required super.pixels});

  factory AppleSprite.random({required CanvasPixelDensity pixelDensity}) {
    final density = pixelDensity.pixelDensity;
    final random = Random();
    final randomX = random.nextInt(density);
    final randomY = random.nextInt(density);

    return AppleSprite(
      pixels: [
        Pixel(
          offset: PixelOffset(x: randomX, y: randomY),
          color: AppColors.primary,
        ),
      ],
    );
  }
}
