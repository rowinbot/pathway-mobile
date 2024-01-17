import 'package:flutter/material.dart';
import 'package:pathway_mobile/theme/insets_theme.dart';

class ThemedDivider extends StatelessWidget {
  final InsetScalar size;
  const ThemedDivider({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: InsetsTheme.of(context).dividers(size));
  }
}
