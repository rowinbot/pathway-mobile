import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathway_mobile/app_router.dart';
import 'package:pathway_mobile/helpers/formatters.dart';
import 'package:pathway_mobile/providers/player_global.dart';
import 'package:pathway_mobile/screens/game_screen.dart';
import 'package:pathway_mobile/services/party/party_service.dart';
import 'package:pathway_mobile/services/party/party_utils.dart';
import 'package:pathway_mobile/theme/insets_theme.dart';
import 'package:pathway_mobile/helpers/validators.dart';
import 'package:pathway_mobile/widgets/themed_divider.dart';

class LobbyForm extends ConsumerStatefulWidget {
  const LobbyForm({super.key});

  @override
  ConsumerState<LobbyForm> createState() => _LobbyFormState();
}

class _LobbyFormState extends ConsumerState<LobbyForm> {
  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  final partyService = const PartyService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  void submit() async {
    if (!formKey.currentState!.validate()) return;

    try {
      var party = await partyService.createOrJoinParty(
        codeController.text.isEmpty ? null : codeController.text,
      );

      if (!mounted) return;
      navigateToRoute<GameScreenArguments>(
        context,
        AppRoutes.game,
        arguments: GameScreenArguments(party),
      );
    } on PartyJoinException catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.status.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentPlayer = ref.watch(playerGlobalProvider);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: codeController,
            decoration: const InputDecoration(
              labelText: "Game code",
            ),
            // Disabled
            enabled: currentPlayer.when(
              data: (player) => true,
              loading: () => false,
              error: (error, stackTrace) => false,
            ),
            inputFormatters: const [GameCodeInputFormatter()],
            validator: gameCodeValidator.fn,
          ),
          const ThemedDivider(size: InsetScalar.small),
          ValueListenableBuilder(
            valueListenable: codeController,
            builder: (context, TextEditingValue value, _) => ElevatedButton(
              onPressed: switch (currentPlayer) {
                AsyncData() => submit,
                AsyncError() => null,
                _ => null,
              },
              child: switch (value.text.isEmpty) {
                true => const Text("Create Game"),
                false => const Text("Join Game"),
              },
            ),
          ),
        ],
      ),
    );
  }
}
