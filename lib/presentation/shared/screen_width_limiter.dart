import 'package:flutter/material.dart';

class ScreenWidthLimiter extends StatefulWidget {
  const ScreenWidthLimiter({super.key, required this.child});

  final Widget child;

  static const double maxWidth = 600;

  @override
  State<ScreenWidthLimiter> createState() => _ScreenWidthLimiterState();
}

class _ScreenWidthLimiterState extends State<ScreenWidthLimiter> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: ScreenWidthLimiter.maxWidth,
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
