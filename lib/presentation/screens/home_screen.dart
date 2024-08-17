import 'package:adivina_el_numero_desafio/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    onSubmit: (value) {},
                  )),
              Flexible(
                  child: TriesCounter(
                remainingTries: 5,
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
            currentLevel: 1,
            label: 'Fácil',
            listSize: 4,
            onChange: (levelSelected) {},
          )
        ],
      ),
    );
  }
}
