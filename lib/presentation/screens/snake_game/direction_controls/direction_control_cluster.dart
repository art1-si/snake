import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/controller/direction_controller.dart';

enum Direction {
  up,
  down,
  left,
  right;

  bool get isVertical => this == Direction.up || this == Direction.down;
  bool get isHorizontal => this == Direction.left || this == Direction.right;
}

class DirectionControlCluster extends StatelessWidget {
  const DirectionControlCluster({super.key, required this.directionController});

  final DirectionController directionController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: SizedBox.square(
          dimension: 250,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ValueListenableBuilder(
              valueListenable: directionController.directionNotifier,
              builder: (context, value, child) {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: DirectionControlButton(
                        disabled: value.isVertical,
                        direction: Direction.up,
                        onPressed: () {
                          directionController.changeDirection(Direction.up);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: DirectionControlButton(
                        disabled: value.isHorizontal,
                        direction: Direction.left,
                        onPressed: () {
                          directionController.changeDirection(Direction.left);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: DirectionControlButton(
                        disabled: value.isHorizontal,
                        direction: Direction.right,
                        onPressed: () {
                          directionController.changeDirection(Direction.right);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: DirectionControlButton(
                        disabled: value.isVertical,
                        direction: Direction.down,
                        onPressed: () {
                          directionController.changeDirection(Direction.down);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DirectionControlButton extends StatelessWidget {
  const DirectionControlButton({
    super.key,
    required this.direction,
    required this.onPressed,
    required this.disabled,
  });

  final Direction direction;
  final VoidCallback onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(disabled ? Colors.white38 : Colors.white),
        padding: MaterialStateProperty.all(const EdgeInsets.all(24)),
        shape: MaterialStateProperty.all(const CircleBorder()),
      ),
      onPressed: disabled ? null : onPressed,
      icon: Icon(
        switch (direction) {
          Direction.up => Icons.arrow_upward,
          Direction.down => Icons.arrow_downward,
          Direction.left => Icons.arrow_back,
          Direction.right => Icons.arrow_forward,
        },
      ),
    );
  }
}
