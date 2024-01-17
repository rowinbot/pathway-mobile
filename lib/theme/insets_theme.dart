import 'dart:ui';

import 'package:flutter/material.dart';

enum InsetScalar {
  extraSmall4,
  extraSmall3,
  extraSmall2,
  extraSmall,
  small,
  normal,
  large,
  extraLarge,
  extraLarge2,
  extraLarge3,
}

class InsetsThemeValue {
  final double baseSize;
  const InsetsThemeValue({this.baseSize = 16});

  double size(InsetScalar scalar) {
    switch (scalar) {
      case InsetScalar.extraSmall4:
        return baseSize * 0.15;
      case InsetScalar.extraSmall3:
        return baseSize * 0.3;
      case InsetScalar.extraSmall2:
        return baseSize * 0.4;
      case InsetScalar.extraSmall:
        return baseSize * 0.6;
      case InsetScalar.small:
        return baseSize * 0.8;
      case InsetScalar.normal:
        return baseSize * 1;
      case InsetScalar.large:
        return baseSize * 1.2;
      case InsetScalar.extraLarge:
        return baseSize * 1.4;
      case InsetScalar.extraLarge2:
        return baseSize * 1.6;
      case InsetScalar.extraLarge3:
        return baseSize * 1.8;
    }
  }

  InsetsThemeValue lerp(covariant InsetsThemeValue other, double t) {
    return InsetsThemeValue(
      baseSize: lerpDouble(baseSize, other.baseSize, t)!,
    );
  }
}

class WidgetInsetsTheme {
  final InsetsThemeValue _padding;
  final InsetsThemeValue _margin;
  final InsetsThemeValue _borderRadius;

  const WidgetInsetsTheme({
    required InsetsThemeValue padding,
    required InsetsThemeValue margin,
    required InsetsThemeValue borderRadius,
  })  : _margin = margin,
        _padding = padding,
        _borderRadius = borderRadius;

  double padding(InsetScalar scalar) {
    return _padding.size(scalar);
  }

  double margin(InsetScalar scalar) {
    return _margin.size(scalar);
  }

  double borderRadius(InsetScalar scalar) {
    return _borderRadius.size(scalar);
  }

  WidgetInsetsTheme lerp(covariant WidgetInsetsTheme other, double t) {
    return WidgetInsetsTheme(
      padding: _padding.lerp(other._padding, t),
      margin: _margin.lerp(other._margin, t),
      borderRadius: _borderRadius.lerp(other._borderRadius, t),
    );
  }
}

class InsetsTheme extends ThemeExtension<InsetsTheme> {
  final WidgetInsetsTheme buttons;
  final WidgetInsetsTheme containers;
  final WidgetInsetsTheme inputs;
  final InsetsThemeValue _dividers;

  static const InsetsTheme _defaultTheme = InsetsTheme();

  const InsetsTheme({
    this.inputs = const WidgetInsetsTheme(
      padding: InsetsThemeValue(baseSize: 20),
      margin: InsetsThemeValue(baseSize: 20),
      borderRadius: InsetsThemeValue(baseSize: 20),
    ),
    this.buttons = const WidgetInsetsTheme(
      padding: InsetsThemeValue(baseSize: 80),
      margin: InsetsThemeValue(baseSize: 80),
      borderRadius: InsetsThemeValue(baseSize: 20),
    ),
    this.containers = const WidgetInsetsTheme(
      padding: InsetsThemeValue(baseSize: 80),
      margin: InsetsThemeValue(baseSize: 80),
      borderRadius: InsetsThemeValue(baseSize: 20),
    ),
    InsetsThemeValue dividers = const InsetsThemeValue(baseSize: 20),
  }) : _dividers = dividers;

  double dividers(InsetScalar scalar) {
    return _dividers.size(scalar);
  }

  static InsetsTheme of(BuildContext context) {
    return Theme.of(context).extension<InsetsTheme>() ?? _defaultTheme;
  }

  @override
  ThemeExtension<InsetsTheme> copyWith() {
    return InsetsTheme(buttons: buttons);
  }

  @override
  InsetsTheme lerp(covariant InsetsTheme? other, double t) {
    if (other == null) {
      return this;
    }

    return InsetsTheme(
      buttons: buttons.lerp(other.buttons, t),
      containers: containers.lerp(other.containers, t),
      dividers: _dividers.lerp(other._dividers, t),
    );
  }
}
