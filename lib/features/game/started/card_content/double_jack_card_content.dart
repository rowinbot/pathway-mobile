import 'package:flutter/material.dart';

/// This is actually a regular Jack, only difference is that this one
/// has two eyes which is a "placing" wildcard in Sequence.
class DoubleJackCardContent extends StatelessWidget {
  final MaterialColor color;
  final double opacity;

  const DoubleJackCardContent({
    super.key,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '🔥',
      style: TextStyle(
        color: color.withOpacity(opacity),
        fontSize: 26,
      ),
    );
  }
}
