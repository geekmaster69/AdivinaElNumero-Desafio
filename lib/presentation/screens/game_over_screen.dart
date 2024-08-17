import 'package:adivina_el_numero_desafio/presentation/providers/game_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameOverScreen extends ConsumerWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'u.u',
              style: TextStyle(fontSize: 30),
            ),
            const Text('Quieres intentarlo de nuevo?'),
            OutlinedButton(
                onPressed: () {
                  ref.read(gameFormProvider.notifier).onGameLevelChange(0);
                },
                child: const Text('Claro que si!'))
          ],
        ),
      ),
    );
  }
}
