// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/canvas_pixel_density.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/sprite.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/view/canvas_grid.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/view/pixel_tile.dart';

import 'package:snake/presentation/theme/app_colors.dart';

/// Widget representing the game canvas.
///
/// The canvas is a grid of pixels where the game sprites are drawn.
class GameCanvas extends StatelessWidget {
  const GameCanvas({
    super.key,
    required this.sprite,
    required this.pixelDensity,
    required this.animationDuration,
  });
  final List<Sprite> sprite;
  final CanvasPixelDensity pixelDensity;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.canvasBackground,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColors.onPrimaryButton,
            width: 1,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final canvasSize =
                constraints.maxWidth > constraints.maxHeight ? constraints.maxHeight : constraints.maxWidth;
            final pixelSize = canvasSize / pixelDensity.pixelDensity;
            return Stack(
              children: [
                CanvasGrid(
                  gridSize: pixelDensity.pixelDensity,
                  pixelSize: pixelSize,
                ),
                ...sprite.map((s) {
                  return SizedBox(
                    width: canvasSize,
                    height: canvasSize,
                    child: ValueListenableBuilder(
                        valueListenable: s.pixelsNotifier,
                        builder: (context, value, child) {
                          return Stack(
                            children: value.map((p) {
                              if (s is MovableSprite) {
                                return AnimatedPositioned(
                                  duration: animationDuration,
                                  left: p.offset.x * pixelSize,
                                  top: p.offset.y * pixelSize,
                                  child: PixelTile(
                                    size: pixelSize,
                                    litWithColor: p.color,
                                    shape: s.shape,
                                  ),
                                );
                              }

                              return Positioned(
                                left: p.offset.x * pixelSize,
                                top: p.offset.y * pixelSize,
                                child: PixelTile(
                                  size: pixelSize,
                                  litWithColor: p.color,
                                  shape: s.shape,
                                ),
                              );
                            }).toList(),
                          );
                        }),
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}
