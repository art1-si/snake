part of 'gameplay_bloc.dart';

sealed class GameplayEvent {
  const GameplayEvent();
}

final class GameStarted extends GameplayEvent {
  const GameStarted();
}

final class GamePaused extends GameplayEvent {
  const GamePaused();
}

final class GameResumed extends GameplayEvent {
  const GameResumed();
}

final class GameEnded extends GameplayEvent {
  const GameEnded();
}

final class AppleEaten extends GameplayEvent {
  const AppleEaten({
    required this.difficultyMultiplier,
  });

  final int difficultyMultiplier;
}
