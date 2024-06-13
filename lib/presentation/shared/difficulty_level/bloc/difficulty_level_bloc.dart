import 'package:bloc/bloc.dart';
import 'package:snake/presentation/shared/difficulty_level/model/difficulty_level.dart';

part 'difficulty_level_event.dart';
part 'difficulty_level_state.dart';

/// A BLoC that manages the state of the difficulty level of the snake game.
class DifficultyLevelBloc extends Bloc<DifficultyLevelEvent, DifficultyLevelState> {
  DifficultyLevelBloc() : super(DifficultyLevelState.easy()) {
    on<DifficultyLevelChanged>(_onDifficultyLevelChanged);
  }

  void _onDifficultyLevelChanged(DifficultyLevelChanged event, Emitter<DifficultyLevelState> emit) {
    switch (event.difficultyLevel) {
      case DifficultyLevel.easy:
        emit(DifficultyLevelState.easy());
        break;
      case DifficultyLevel.medium:
        emit(DifficultyLevelState.medium());
        break;
      case DifficultyLevel.hard:
        emit(DifficultyLevelState.hard());
        break;
    }
  }
}
