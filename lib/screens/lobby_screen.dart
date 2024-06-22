import 'package:flutter/material.dart';
import 'package:pathway_mobile/features/lobby/lobby_form.dart';
import 'package:pathway_mobile/features/nickname/nickname_form.dart';
import 'package:pathway_mobile/theme/insets_theme.dart';
import 'package:pathway_mobile/widgets/themed_divider.dart';

class LobbyScreen extends StatelessWidget {
  static const String title = "Lobby";
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: EdgeInsets.all(
          InsetsTheme.of(context).containers.padding(InsetScalar.extraSmall2),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search or create a new game",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const ThemedDivider(size: InsetScalar.normal),
              const LobbyForm(),
              const ThemedDivider(size: InsetScalar.extraLarge3),
              Text(
                "Update your nickname",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const ThemedDivider(size: InsetScalar.small),
              const NicknameForm(),
            ],
          ),
        ),
      ),
    );
  }
}
