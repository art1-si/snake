import 'package:flutter/material.dart';
import 'package:snake/presentation/theme/app_colors.dart';

class PixelTile extends StatelessWidget {
  const PixelTile({
    super.key,
    required this.size,
    this.litWithColor,
  });

  final double size;
  final Color? litWithColor;

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
              borderRadius: BorderRadius.circular(2),
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
