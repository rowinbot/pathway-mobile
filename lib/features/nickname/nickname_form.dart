import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathway_mobile/providers/player_global.dart';
import 'package:pathway_mobile/theme/insets_theme.dart';
import 'package:pathway_mobile/helpers/validators.dart';
import 'package:pathway_mobile/widgets/themed_divider.dart';

class NicknameForm extends ConsumerStatefulWidget {
  const NicknameForm({Key? key}) : super(key: key);

  @override
  ConsumerState<NicknameForm> createState() => _NicknameFormState();
}

class _NicknameFormState extends ConsumerState<NicknameForm> {
  final formKey = GlobalKey<FormState>();
  final nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// Fires when the player state changes
    ref.listenManual(playerGlobalProvider, (prev, next) {
      // Ignore if no real change to nickname
      if (prev?.value?.nickname == next.value?.nickname) return;
      // Ignore if no difference with the field's value
      if (next.value?.nickname == nicknameController.text) return;

      next.whenData((player) {
        nicknameController.value = TextEditingValue(text: player.nickname);
      });
    }, fireImmediately: true);
  }

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  void submit() async {
    if (!formKey.currentState!.validate()) return;

    await ref
        .read(playerGlobalProvider.notifier)
        .updateNickname(nicknameController.text);

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Nickname updated"),
      ),
    );
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
            controller: nicknameController,
            decoration: const InputDecoration(
              labelText: "Nickname",
            ),
            // Disabled
            enabled: currentPlayer.when(
              data: (player) => true,
              loading: () => false,
              error: (error, stackTrace) => false,
            ),
            validator: nicknameValidator.fn,
          ),
          const ThemedDivider(size: InsetScalar.small),
          ElevatedButton(
            onPressed: switch (currentPlayer) {
              AsyncData() => submit,
              AsyncError() => null,
              _ => null,
            },
            child: const Text("Update Nickname"),
          ),
        ],
      ),
    );
  }
}
