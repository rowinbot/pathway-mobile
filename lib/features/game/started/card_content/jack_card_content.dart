import 'package:flutter/material.dart';

class JackCardContent extends StatelessWidget {
  final MaterialColor color;
  final double opacity;

  const JackCardContent({
    super.key,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '💣',
      style: TextStyle(
        color: color.withOpacity(opacity),
        fontSize: 24,
      ),
    );
  }
}
