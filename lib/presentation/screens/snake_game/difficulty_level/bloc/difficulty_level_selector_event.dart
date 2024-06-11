part of 'difficulty_level_selector_bloc.dart';

sealed class DifficultyLevelSelectorEvent {}

final class DifficultyLevelChanged extends DifficultyLevelSelectorEvent {
  final DifficultyLevel difficultyLevel;

  DifficultyLevelChanged(this.difficultyLevel);
}
