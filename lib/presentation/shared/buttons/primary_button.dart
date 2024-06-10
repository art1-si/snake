import 'package:flutter/material.dart';
import 'package:snake/presentation/theme/app_colors.dart';
import 'package:snake/presentation/theme/styled_text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor = AppColors.onPrimaryButton,
    this.icon,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: textColor,
              ),
              const SizedBox(width: 8)
            ],
            StyledText.button(text, color: textColor),
          ],
        ),
      ),
    );
  }
}
