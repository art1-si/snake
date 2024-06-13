/// Events that can be dispatched to the game engine by the gameplay controller.
sealed class GameplayEvents {
  const GameplayEvents();
}

/// Event dispatched when the game starts.
class StartGame extends GameplayEvents {
  const StartGame();
}

/// Event dispatched when the game is paused.
class PauseGame extends GameplayEvents {
  const PauseGame();
}

/// Event dispatched when the game is resumed.
class ResumeGame extends GameplayEvents {
  const ResumeGame();
}

/// Event dispatched when the game ends.
class EndGame extends GameplayEvents {
  const EndGame();
}

/// Event dispatched when the game ticks.
class TickerEvent extends GameplayEvents {
  const TickerEvent();
}
