import 'package:flutter/material.dart';

class KingCardContent extends StatelessWidget {
  final MaterialColor color;
  final double opacity;

  const KingCardContent({
    super.key,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '🤴',
      style: TextStyle(
        color: color.withOpacity(opacity),
        fontSize: 26,
      ),
    );
  }
}
