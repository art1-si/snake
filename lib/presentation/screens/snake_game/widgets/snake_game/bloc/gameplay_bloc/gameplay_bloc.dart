import 'package:bloc/bloc.dart';

part 'gameplay_event.dart';
part 'gameplay_state.dart';

class GameplayBloc extends Bloc<GameplayEvent, GameplayState> {
  GameplayBloc() : super(GameplayInitial()) {
    on<GameStarted>(_onGameStarted);
    on<GamePaused>(_onGamePaused);
    on<GameResumed>(_onGameResumed);
    on<GameEnded>(_onGameEnded);
    on<AppleEaten>(_onAppleEaten);
  }

  void _onGameStarted(GameStarted event, Emitter<GameplayState> emit) {
    emit(GameInProgress(score: 0));
  }

  void _onGamePaused(GamePaused event, Emitter<GameplayState> emit) {
    if (state is GameInProgress) {
      emit(GameOnPaused(score: (state as GameInProgress).score));
    }
  }

  void _onGameResumed(GameResumed event, Emitter<GameplayState> emit) {
    if (state is GameOnPaused) {
      emit(GameInProgress(score: (state as GameOnPaused).score));
    }
  }

  void _onGameEnded(GameEnded event, Emitter<GameplayState> emit) {
    if (state is GameInProgress) {
      emit(GameOver(score: (state as GameInProgress).score));
    }
  }

  void _onAppleEaten(AppleEaten event, Emitter<GameplayState> emit) {
    if (state is GameInProgress) {
      final currentScore = (state as GameInProgress).score;
      emit(GameInProgress(score: currentScore + event.difficultyMultiplier));
    }
  }
}
