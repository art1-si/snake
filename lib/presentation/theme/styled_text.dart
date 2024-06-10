import 'package:flutter/material.dart';

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

  factory StyledText.heading1(String data) {
    return StyledText(data, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold));
  }

  factory StyledText.heading2(String data) {
    return StyledText(data, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
  }

  factory StyledText.heading3(String data) {
    return StyledText(data, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  factory StyledText.body(String data) {
    return StyledText(data, style: const TextStyle(fontSize: 16));
  }

  factory StyledText.caption(String data) {
    return StyledText(data, style: const TextStyle(fontSize: 12));
  }

  factory StyledText.button(String data) {
    return StyledText(data, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
  }
}
