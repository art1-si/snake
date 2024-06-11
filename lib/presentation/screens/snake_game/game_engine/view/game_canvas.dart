// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/canvas_pixel_density.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/sprite.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/view/canvas_grid.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/view/pixel_tile.dart';

import 'package:snake/presentation/theme/app_colors.dart';

class GameCanvas extends StatelessWidget {
  const GameCanvas({
    super.key,
    required this.sprite,
    required this.pixelDensity,
  });
  final List<Sprite> sprite;
  final CanvasPixelDensity pixelDensity;

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
            final movableSprites = sprite.whereType<MovableSprite>();
            final unmovableSprites = sprite.whereType<UnmovableSprite>();
            return Stack(
              children: [
                CanvasGrid(
                  gridSize: pixelDensity.pixelDensity,
                  pixelSize: pixelSize,
                ),

                // Unmovable sprites
                ...unmovableSprites.map((s) {
                  return s.pixels.map((p) {
                    return Positioned(
                      left: p.offset.x * pixelSize,
                      top: p.offset.y * pixelSize,
                      child: PixelTile(
                        size: pixelSize,
                        litWithColor: p.color,
                      ),
                    );
                  });
                }).expand((element) => element),

                // Movable sprites

                ...movableSprites.map((s) {
                  return SizedBox(
                    width: canvasSize,
                    height: canvasSize,
                    child: ValueListenableBuilder(
                        valueListenable: s.pixelsNotifier,
                        builder: (context, value, child) {
                          return Stack(
                            children: value.map((p) {
                              return Positioned(
                                left: p.offset.x * pixelSize,
                                top: p.offset.y * pixelSize,
                                child: PixelTile(
                                  size: pixelSize,
                                  litWithColor: p.color,
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
