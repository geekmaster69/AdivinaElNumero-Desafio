import 'package:adivina_el_numero_desafio/presentation/providers/game_form_provider.dart';
import 'package:adivina_el_numero_desafio/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final gameFormState = ref.watch(gameFormProvider);
    final gameFormNotifier = ref.watch(gameFormProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
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
                remainingTries: gameFormState.gameLevel.tries,
              ))
            ],
          ),
          SizedBox(
            height: size.height * 0.33,
            child: Row(
              children: [
                CounterWidget(numbers: [], title: 'Mayor que'),
                CounterWidget(numbers: [], title: 'Menor que'),
                CounterWidget(numbers: [], title: 'Historial'),
              ],
            ),
          ),
          SliderGameLevel(
            currentLevel: gameFormState.gameLevelIndex,
            label: gameFormState.gameLevel.label,
            listSize: gameLevels.length,
            onChange: (levelSelected) {
              gameFormNotifier.onGameLevelChange(levelSelected.toInt());
            },
          )
        ],
      ),
    );
  }
}
