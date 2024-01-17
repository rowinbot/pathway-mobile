import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathway_mobile/features/game/game_main.dart';
import 'package:pathway_mobile/models/party/party.dart';
import 'package:share_plus/share_plus.dart';

class GameScreenArguments {
  final Party party;

  GameScreenArguments(this.party);
}

class GameScreen extends StatelessWidget {
  static const String title = "Game";
  static const pathwayGameUrl = "https://pathway.rowinbot.com/game";

  const GameScreen({Key? key}) : super(key: key);

  GameScreenArguments getArguments(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments as GameScreenArguments;
  }

  void shareGame(BuildContext context) async {
    final arguments = getArguments(context);
    final isDesktop =
        Platform.isWindows || Platform.isLinux || Platform.isMacOS;

    if (isDesktop) {
      await Clipboard.setData(
          ClipboardData(text: "$pathwayGameUrl/${arguments.party.code}"));
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Copied game code to clipboard"),
        ),
      );
    } else {
      Share.share('Join my game on Pathway! Code: ${arguments.party.code}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameScreenArguments = getArguments(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Game #${gameScreenArguments.party.code}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => shareGame(context),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: GameMain(party: gameScreenArguments.party),
    );
  }
}
