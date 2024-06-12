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
    return AppleSprite(
      pixelDensity: pixelDensity,
      pixels: [
        Pixel(
          offset: _generateRandomAvailablePixelOffset(
            unavailablePixelOffsets: unavailablePixelOffsets,
            pixelDensity: pixelDensity,
          ),
          color: AppColors.primary,
        ),
      ],
    );
  }

  @override
  void respawn({
    required List<Pixel> unavailablePixelOffsets,
  }) {
    pixelsNotifier.value = [
      Pixel(
        offset: _generateRandomAvailablePixelOffset(
          unavailablePixelOffsets: unavailablePixelOffsets,
          pixelDensity: pixelDensity,
        ),
        color: AppColors.primary,
      ),
    ];
  }

  static PixelOffset _generateRandomAvailablePixelOffset({
    required CanvasPixelDensity pixelDensity,
    required List<Pixel> unavailablePixelOffsets,
  }) {
    PixelOffset? randomOffset;
    do {
      randomOffset = randomOffsetGenerator(pixelDensity: pixelDensity);
    } while (unavailablePixelOffsets.any((element) => element.offset == randomOffset));

    return randomOffset;
  }

  static PixelOffset randomOffsetGenerator({required CanvasPixelDensity pixelDensity}) {
    final density = pixelDensity.pixelDensity;
    final random = Random();

    final randomX = random.nextInt(density);
    final randomY = random.nextInt(density);

    return PixelOffset(x: randomX, y: randomY);
  }
}
