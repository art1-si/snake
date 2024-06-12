import 'dart:ui';

import 'package:snake/presentation/screens/snake_game/direction_controls/direction_control_cluster.dart';

class Pixel {
  Pixel({required this.offset, required this.color});
  final PixelOffset offset;
  final Color color;

  @override
  bool operator ==(covariant Pixel other) {
    if (identical(this, other)) return true;

    return other.offset == offset && other.color == color;
  }

  @override
  int get hashCode => offset.hashCode ^ color.hashCode;

  Pixel copyWith({
    PixelOffset? offset,
    Color? color,
  }) {
    return Pixel(
      offset: offset ?? this.offset,
      color: color ?? this.color,
    );
  }

  @override
  String toString() => 'Pixel(offset: $offset, color: $color)';

  Pixel move(Direction direction) {
    switch (direction) {
      case Direction.up:
        return copyWith(offset: PixelOffset(x: offset.x, y: offset.y - 1));
      case Direction.down:
        return copyWith(offset: PixelOffset(x: offset.x, y: offset.y + 1));
      case Direction.left:
        return copyWith(offset: PixelOffset(x: offset.x - 1, y: offset.y));
      case Direction.right:
        return copyWith(offset: PixelOffset(x: offset.x + 1, y: offset.y));
    }
  }
}

class PixelOffset {
  const PixelOffset({
    required this.x,
    required this.y,
  });

  final int x;
  final int y;

  bool isOfCoordinates(int x, int y) => this.x == x && this.y == y;

  @override
  String toString() => 'PixelOffset(x: $x, y: $y)';

  @override
  bool operator ==(covariant PixelOffset other) {
    if (identical(this, other)) return true;

    return other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
