import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/controller/direction_controller.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/direction.dart';

/// Group of buttons that allow the user to control the direction of the sprite.
///
/// It also listens to the keyboard events to change the direction.
class DirectionControlCluster extends StatefulWidget {
  const DirectionControlCluster({super.key, required this.directionController});

  final DirectionController directionController;

  @override
  State<DirectionControlCluster> createState() => _DirectionControlClusterState();
}

class _DirectionControlClusterState extends State<DirectionControlCluster> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  KeyEventResult onKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowUp:
          widget.directionController.changeDirection(Direction.up);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowDown:
          widget.directionController.changeDirection(Direction.down);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowLeft:
          widget.directionController.changeDirection(Direction.left);
          return KeyEventResult.handled;
        case LogicalKeyboardKey.arrowRight:
          widget.directionController.changeDirection(Direction.right);
          return KeyEventResult.handled;
        default:
          return KeyEventResult.ignored;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onKeyEvent: onKeyEvent,
      child: SizedBox(
        height: 200,
        child: Center(
          child: SizedBox.square(
            dimension: 250,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ValueListenableBuilder(
                valueListenable: widget.directionController.directionNotifier,
                builder: (context, value, child) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: DirectionControlButton(
                          direction: Direction.up,
                          onPressed: () {
                            widget.directionController.changeDirection(Direction.up);
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: DirectionControlButton(
                          direction: Direction.left,
                          onPressed: () {
                            widget.directionController.changeDirection(Direction.left);
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DirectionControlButton(
                          direction: Direction.right,
                          onPressed: () {
                            widget.directionController.changeDirection(Direction.right);
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: DirectionControlButton(
                          direction: Direction.down,
                          onPressed: () {
                            widget.directionController.changeDirection(Direction.down);
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
      ),
    );
  }
}

class DirectionControlButton extends StatelessWidget {
  const DirectionControlButton({
    super.key,
    required this.direction,
    required this.onPressed,
  });

  final Direction direction;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(const EdgeInsets.all(24)),
        shape: MaterialStateProperty.all(const CircleBorder()),
      ),
      onPressed: onPressed,
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
