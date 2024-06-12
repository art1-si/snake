import 'package:snake/presentation/shared/difficulty_level/model/difficulty_level.dart';

extension DifficultyLevelTickerSpeed on DifficultyLevel {
  Duration get tickerSpeed {
    switch (this) {
      case DifficultyLevel.easy:
        return const Duration(milliseconds: 500);
      case DifficultyLevel.medium:
        return const Duration(milliseconds: 250);
      case DifficultyLevel.hard:
        return const Duration(milliseconds: 100);
    }
  }
}
