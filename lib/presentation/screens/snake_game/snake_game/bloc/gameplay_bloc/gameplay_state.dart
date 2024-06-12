part of 'gameplay_bloc.dart';

sealed class GameplayState {}

final class GameplayInitial extends GameplayState {}

final class GameInProgress extends GameplayState {
  GameInProgress({required this.score});
  final int score;
}

final class GameOnPaused extends GameplayState {
  GameOnPaused({required this.score});
  final int score;
}

final class GameOver extends GameplayState {
  GameOver({required this.score});
  final int score;
}
