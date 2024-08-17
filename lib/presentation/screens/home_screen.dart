import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/config.dart';
import '../providers/provider.dart';
import '../widgets/widgets.dart';
import 'game_over_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final gameFormState = ref.watch(gameFormProvider);
    final gameFormNotifier = ref.watch(gameFormProvider.notifier);

    ref.listen(
      gameFormProvider,
      (previous, next) {
        if (next.message.isEmpty) return;

        showSnackbar(context, next.message);
      },
    );

    return (gameFormState.endGame)
        ? GameOverScreen(
            currentNumber: gameFormState.currentNumber,
            onTap: () => gameFormNotifier
                .onGameLevelChange(gameFormState.gameLevelIndex),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Home Screen'),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        flex: 1,
                        child: CustomTextFormField(
                          hintText: 'Ingrese un numero',
                          label: 'Adivina el numero',
                          onSubmit: (value) {
                            final gamerResponse = int.tryParse(value) ?? 0;

                            gameFormNotifier.onFormSubmit(gamerResponse);
                          },
                        )),
                    Flexible(
                        child: TriesCounter(
                      remainingTries: gameFormState.triesRemaining,
                    ))
                  ],
                ),
                SizedBox(
                  height: size.height * 0.33,
                  child: Row(
                    children: [
                      CounterWidget(
                          numbers: gameFormState.greaterThan,
                          title: 'Mayor que'),
                      CounterWidget(
                          numbers: gameFormState.minorThan, title: 'Menor que'),
                      CounterWidget(
                          numbers: gameFormState.history, title: 'Historial'),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SliderGameLevel(
                    currentLevel: gameFormState.gameLevelIndex,
                    label: gameFormState.gameLevel.label,
                    listSize: gameLevels.length,
                    onChange: (levelSelected) {
                      gameFormNotifier.onGameLevelChange(levelSelected.toInt());
                    },
                  ),
                )
              ],
            ),
          );
  }
}
