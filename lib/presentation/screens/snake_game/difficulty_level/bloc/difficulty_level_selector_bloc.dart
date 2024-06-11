import 'package:bloc/bloc.dart';
import 'package:snake/presentation/screens/snake_game/difficulty_level/model/difficulty_level.dart';

part 'difficulty_level_selector_event.dart';
part 'difficulty_level_selector_state.dart';

class DifficultyLevelSelectorBloc extends Bloc<DifficultyLevelSelectorEvent, DifficultyLevelSelectorState> {
  DifficultyLevelSelectorBloc() : super(DifficultyLevelSelectorState.easy()) {
    on<DifficultyLevelChanged>(_onDifficultyLevelChanged);
  }

  void _onDifficultyLevelChanged(DifficultyLevelChanged event, Emitter<DifficultyLevelSelectorState> emit) {
    switch (event.difficultyLevel) {
      case DifficultyLevel.easy:
        emit(DifficultyLevelSelectorState.easy());
        break;
      case DifficultyLevel.medium:
        emit(DifficultyLevelSelectorState.medium());
        break;
      case DifficultyLevel.hard:
        emit(DifficultyLevelSelectorState.hard());
        break;
    }
  }
}
