import 'dart:async';

import 'package:snake/presentation/screens/snake_game/game_engine/models/game_play_event.dart';

class GameplayController with ListenableEvent<GameplayEvents> {
  GameplayController({
    this.tickerSpeed = const Duration(milliseconds: 250),
  });

  final Duration tickerSpeed;

  Timer? _timer;

  bool get isGameRunning => _timer != null;

  void startGame() {
    if (_timer != null) {
      _timer!.cancel();
    }
    notify(const StartGame());
    _timer = Timer.periodic(tickerSpeed, (_) {
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
