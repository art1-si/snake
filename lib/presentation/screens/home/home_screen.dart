import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snake/presentation/navigation/navigation_route.dart';
import 'package:snake/presentation/shared/buttons/primary_button.dart';
import 'package:snake/presentation/shared/buttons/secondary_button.dart';
import 'package:snake/presentation/theme/app_colors.dart';
import 'package:snake/presentation/theme/styled_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 16,
              child: IconButton(
                onPressed: () {
                  context.pushNamed(NavigationRoute.settings.key);
                },
                icon: const Icon(
                  Icons.settings,
                  color: AppColors.onBackground,
                  size: 32,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                StyledText.heading1(
                  'SNAKE GAME',
                ),
                const SizedBox(height: 64),
                PrimaryButton(
                  text: 'START GAME',
                  icon: Icons.play_circle_fill_sharp,
                  onPressed: () {
                    context.goNamed(NavigationRoute.snakeGame.key);
                  },
                ),
                const SizedBox(height: 16),
                SecondaryButton(
                  text: 'LEADERBOARD',
                  icon: Icons.leaderboard,
                  onPressed: () {
                    context.pushNamed(NavigationRoute.leaderboard.key);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
