import 'dart:math';

import 'package:snake/presentation/screens/snake_game/game_engine/models/canvas_pixel_density.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/pixel.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/pixel_shape.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/sprite.dart';
import 'package:snake/presentation/theme/app_colors.dart';

class AppleSprite extends UnmovableSprite {
  AppleSprite({required super.pixels, required this.pixelDensity})
      : super(
          shape: PixelShape.circle,
        );

  final CanvasPixelDensity pixelDensity;

  factory AppleSprite.random({
    required CanvasPixelDensity pixelDensity,
    required List<Pixel> unavailablePixelOffsets,
  }) {
    final density = pixelDensity.pixelDensity;
    final random = Random();
    final randomX = random.nextInt(density);
    final randomY = random.nextInt(density);

    return AppleSprite(
      pixelDensity: pixelDensity,
      pixels: [
        Pixel(
          offset: PixelOffset(x: randomX, y: randomY),
          color: AppColors.primary,
        ),
      ],
    );
  }

  @override
  void respawn({
    required List<Pixel> unavailablePixelOffsets,
  }) {
    final density = pixelDensity.pixelDensity;
    final random = Random();
    final randomX = random.nextInt(density);
    final randomY = random.nextInt(density);

    pixelsNotifier.value = [
      Pixel(
        offset: PixelOffset(x: randomX, y: randomY),
        color: AppColors.primary,
      ),
    ];
  }
}
