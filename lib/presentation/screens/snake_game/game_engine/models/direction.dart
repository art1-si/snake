enum Direction {
  up,
  down,
  left,
  right;

  bool get isVertical => this == Direction.up || this == Direction.down;
  bool get isHorizontal => this == Direction.left || this == Direction.right;
}

/// Class representing a consumable direction.
///
/// A consumable direction is a direction that allows to not override
/// new directions before current one is not yet consumed.
///
/// This is useful in case when user changes but directions quicker than
/// a ticker can consume them.
class ConsumableDirection {
  ConsumableDirection(this.direction);

  /// Consumes the direction.
  void consume() {
    if (_consumed) {
      return;
    }
    _consumed = true;
  }

  final Direction direction;
  bool _consumed = false;

  bool get isConsumed => _consumed;
}
