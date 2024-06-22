import 'package:flutter/material.dart';
import 'package:pathway_mobile/app_router.dart';
import 'package:pathway_mobile/theme/insets_theme.dart';
import 'package:pathway_mobile/widgets/themed_divider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: EdgeInsets.all(
          InsetsTheme.of(context).containers.padding(InsetScalar.extraSmall2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pathway',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'The Game',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const ThemedDivider(
              size: InsetScalar.normal,
            ),
            FilledButtonTheme(
              data: FilledButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              child: FilledButton(
                child: const Text("Plays!"),
                onPressed: () => navigateToRoute(context, AppRoutes.lobby),
              ),
            )
          ],
        ),
      ),
    );
  }
}
