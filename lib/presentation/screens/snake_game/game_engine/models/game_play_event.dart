sealed class GameplayEvents {
  const GameplayEvents();
}

class StartGame extends GameplayEvents {
  const StartGame();
}

class PauseGame extends GameplayEvents {
  const PauseGame();
}

class ResumeGame extends GameplayEvents {
  const ResumeGame();
}

class EndGame extends GameplayEvents {
  const EndGame();
}

class TickerEvent extends GameplayEvents {
  const TickerEvent();
}
