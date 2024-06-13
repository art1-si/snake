import 'dart:async';

import 'package:snake/presentation/screens/snake_game/game_engine/models/game_play_event.dart';

/// Controller class for managing gameplay events and state.
class GameplayController with ListenableEvent<GameplayEvents> {
  GameplayController({
    this.tickerSpeed = const Duration(milliseconds: 250),
  });

  /// The speed at which the game ticks.
  final Duration tickerSpeed;

  Timer? _timer;

  /// Returns whether the game is currently running.
  bool get isGameRunning => _timer != null;

  /// Starts the game.
  void startGame() {
    if (_timer != null) {
      _timer!.cancel();
    }
    notify(const StartGame());
    _timer = Timer.periodic(tickerSpeed, (_) {
      notify(const TickerEvent());
    });
  }

  /// Pauses the game.
  void pauseGame() {
    _timer?.cancel();
    notify(const PauseGame());
  }

  /// Resumes the game.
  void resumeGame() {
    startGame();
    notify(const ResumeGame());
  }

  /// Ends the game.
  void endGame() {
    _timer?.cancel();
    notify(const EndGame());
  }

  /// Disposes the controller.
  void dispose() {
    _timer?.cancel();
  }
}

/// Mixin for adding listeners to an event.
mixin ListenableEvent<T> {
  final _listeners = <void Function(T)>{};

  /// Adds a listener to the event.
  void addListener(void Function(T) listener) {
    _listeners.add(listener);
  }

  /// Removes a listener from the event.
  void removeListener(void Function(T) listener) {
    _listeners.remove(listener);
  }

  /// Notifies all listeners of the event.
  void notify(T event) {
    for (final listener in _listeners) {
      listener(event);
    }
  }
}
