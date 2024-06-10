import 'package:flutter/material.dart';
import 'package:snake/presentation/theme/app_colors.dart';

class StyledText extends Text {
  const StyledText(
    super.data, {
    super.key,
    super.textAlign,
    super.textDirection,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.style,
    super.locale,
    super.strutStyle,
  });

  factory StyledText.heading1(String data, {Color color = AppColors.onBackground}) {
    return StyledText(
      data,
      style: TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        color: color,
        height: 1.0,
      ),
      maxLines: 3,
      textAlign: TextAlign.center,
    );
  }

  factory StyledText.heading2(String data, {Color color = AppColors.onBackground}) {
    return StyledText(
      data,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  factory StyledText.heading3(String data, {Color color = AppColors.onBackground}) {
    return StyledText(
      data,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  factory StyledText.body(String data, {Color color = AppColors.onBackground}) {
    return StyledText(data,
        style: TextStyle(
          fontSize: 16,
          color: color,
        ));
  }

  factory StyledText.caption(String data, {Color color = AppColors.onBackground}) {
    return StyledText(data,
        style: TextStyle(
          fontSize: 12,
          color: color,
        ));
  }

  factory StyledText.button(String data, {Color color = AppColors.onPrimaryButton}) {
    return StyledText(data,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: color,
        ));
  }
  factory StyledText.textButton(String data, {Color color = AppColors.onBackground}) {
    return StyledText(
      data,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: color,
        decoration: TextDecoration.underline,
        decorationColor: color,
      ),
    );
  }
}
