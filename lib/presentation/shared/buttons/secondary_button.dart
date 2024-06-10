import 'package:flutter/material.dart';
import 'package:snake/presentation/theme/app_colors.dart';
import 'package:snake/presentation/theme/styled_text.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor = AppColors.onBackground,
    this.icon,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: textColor,
      ),
      label: StyledText.textButton(
        text,
        color: textColor,
      ),
    );
  }
}
