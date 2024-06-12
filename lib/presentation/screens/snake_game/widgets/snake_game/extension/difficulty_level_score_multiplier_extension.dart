import 'package:snake/presentation/shared/difficulty_level/model/difficulty_level.dart';

extension DifficultyLevelScoreMultiplier on DifficultyLevel {
  int get scoreMultiplier {
    switch (this) {
      case DifficultyLevel.easy:
        return 10;
      case DifficultyLevel.medium:
        return 25;
      case DifficultyLevel.hard:
        return 50;
    }
  }
}
