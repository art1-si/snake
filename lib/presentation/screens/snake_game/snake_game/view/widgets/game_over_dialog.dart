import 'package:flutter/material.dart';
import 'package:snake/presentation/theme/app_colors.dart';
import 'package:snake/presentation/theme/styled_text.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog._({super.key, required this.score, required this.onRestart});

  final int score;
  final VoidCallback onRestart;

  static void show(BuildContext context, {Key? key, required int score, required VoidCallback onRestart}) {
    showDialog(
      context: context,
      builder: (context) {
        return GameOverDialog._(
          key: key,
          score: score,
          onRestart: onRestart,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StyledText.heading1('Game Over'),
            StyledText.heading3('You lost!'),
            const SizedBox(height: 8),
            StyledText.heading3("Your score is: $score"),
            const SizedBox(height: 64),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    onRestart();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Start Again!'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
