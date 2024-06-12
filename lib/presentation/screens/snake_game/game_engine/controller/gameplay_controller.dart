import 'dart:async';

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

class GameplayController with ListenableEvent<GameplayEvents> {
  GameplayController();
  Timer? _timer;

  bool get isGameRunning => _timer != null;

  void startGame() {
    if (_timer != null) {
      _timer!.cancel();
    }
    notify(const StartGame());
    _timer = Timer.periodic(const Duration(milliseconds: 250), (_) {
      notify(const TickerEvent());
    });
  }

  void pauseGame() {
    _timer?.cancel();
    notify(const PauseGame());
  }

  void resumeGame() {
    startGame();
    notify(const ResumeGame());
  }

  void endGame() {
    _timer?.cancel();
    notify(const EndGame());
  }

  void dispose() {
    _timer?.cancel();
  }
}

mixin ListenableEvent<T> {
  final _listeners = <void Function(T)>{};

  void addListener(void Function(T) listener) {
    _listeners.add(listener);
  }

  void removeListener(void Function(T) listener) {
    _listeners.remove(listener);
  }

  void notify(T event) {
    for (final listener in _listeners) {
      listener(event);
    }
  }
}
