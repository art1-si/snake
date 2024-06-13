import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snake/presentation/navigation/navigation_route.dart';
import 'package:snake/presentation/shared/buttons/primary_button.dart';
import 'package:snake/presentation/shared/difficulty_level/view/difficulty_level_selector.dart';
import 'package:snake/presentation/shared/screen_width_limiter.dart';
import 'package:snake/presentation/theme/app_colors.dart';
import 'package:snake/presentation/theme/styled_text.dart';

/// The home screen of the app.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ScreenWidthLimiter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              StyledText.heading1(
                'SNAKE GAME',
              ),
              const SizedBox(height: 64),
              const DifficultyLevelSelector(),
              const SizedBox(height: 16),
              PrimaryButton(
                text: 'START GAME',
                icon: Icons.play_circle_fill_sharp,
                onPressed: () {
                  context.pushNamed(NavigationRoute.snakeGame.key);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
