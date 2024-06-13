# Game Engine

It's a simple game engine that allows you to create 2d games.

## Code Structure

The project structure is organized as follows:

```css
game_engine/
    ├── controller/
    ├── models/
    ├── view/

```

* `controller/`: Contains controllers for managing game direction and gameplay events.
* `models/`: Contains data models such as sprites, pixels, and gameplay events.
* `view/`: Contains widgets for rendering the game canvas and its elements.

## Core Concepts

### `GameWidget`

The main class and also a widget of the engine is `GameWidget`. It's an abstract class that allows you to insert you game into the widget tree.

It provides certain callback like:

```dart
  /// Called when a collision occurs between two sprites.
  void onCollisionWithOtherSprite(Sprite sprite1, Sprite sprite2);

  /// Called when a collision occurs between a sprite and the wall.
  void onCollisionWithWall(Sprite sprite);

  /// Called when a sprite collides with itself.
  void onCollisionWithItself(Sprite sprite);

  /// Builds the list of sprites in the game.
  List<Sprite> spriteBuilder();
```

This helps to have different behavior for different cases.

### `GameplayController`

It's a simple controller that allows you to control gameplay, like starting a game, or pausing.

It's also, a place where ticker for the game is stored.

Furthermore, it's allowing to listen to `GameplayEvents`, like:

```dart
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
```

### `DirectionController`

Controller responsible for managing and controlling moveable sprites in the game.

### Sprite

A base class representing a game entity. It can be either moveable or unmovable.

### Pixel

Represents a single unit on the game canvas with a position and color.

### `GameCanvas`

A widget that renders the game canvas and displays the sprites.

### `PixelTile`

A widget that represents a tile on the game canvas.

### `CanvasGrid`

A widget that represents the grid structure of the game canvas.
