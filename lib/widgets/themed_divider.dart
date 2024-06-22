import 'package:flutter/material.dart';
import 'package:pathway_mobile/theme/insets_theme.dart';

class ThemedDivider extends StatelessWidget {
  final InsetScalar size;
  const ThemedDivider({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: InsetsTheme.of(context).dividers(size));
  }
}
