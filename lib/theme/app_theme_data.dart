import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pathway_mobile/theme/insets_theme.dart';

const TextStyle _kHeadlineLarge = TextStyle(
  fontSize: 48,
  color: Colors.black,
  fontWeight: FontWeight.w900,
);

const TextStyle _kHeadlineMedium = TextStyle(
  fontSize: 30,
  color: Colors.black,
  fontWeight: FontWeight.normal,
);

const TextStyle _kLabelLarge = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

const TextStyle _kBodyLarge = TextStyle(
  fontSize: 18,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

ThemeData buildAppThemeData(BuildContext context) {
  var theme = Theme.of(context);
  var insetsTheme = InsetsTheme.of(context);

  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(
      theme.textTheme,
    ).copyWith(
      headlineLarge: _kHeadlineLarge,
      headlineMedium: _kHeadlineMedium,
      labelLarge: _kLabelLarge,
      bodyLarge: _kBodyLarge,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          insetsTheme.inputs.borderRadius(
            InsetScalar.extraSmall2,
          ),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: insetsTheme.inputs.padding(
          InsetScalar.normal,
        ),
        vertical: insetsTheme.inputs.padding(
          InsetScalar.extraSmall2,
        ),
      ),
    ),
    extensions: const [InsetsTheme()],
  );
}
