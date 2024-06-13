import 'package:flutter/material.dart';
import 'package:snake/presentation/screens/snake_game/game_engine/models/pixel_shape.dart';
import 'package:snake/presentation/theme/app_colors.dart';

/// Widget representing a tile on the game canvas.
class PixelTile extends StatelessWidget {
  const PixelTile({
    super.key,
    required this.size,
    this.shape = PixelShape.square,
    this.litWithColor,
  });

  final double size;
  final Color? litWithColor;
  final PixelShape shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: litWithColor,
              borderRadius:
                  shape == PixelShape.circle ? BorderRadius.circular(size / 2) : BorderRadius.circular(size / 10),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.3),
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
