import 'package:snake/presentation/screens/snake_game/game_engine/models/canvas_pixel_density.dart';

/// Enum representing the difficulty level of the game.
enum DifficultyLevel {
  easy,
  medium,
  hard;

  CanvasPixelDensity get pixelDensity {
    switch (this) {
      case DifficultyLevel.easy:
        return CanvasPixelDensity.low;
      case DifficultyLevel.medium:
        return CanvasPixelDensity.medium;
      case DifficultyLevel.hard:
        return CanvasPixelDensity.high;
    }
  }
}
