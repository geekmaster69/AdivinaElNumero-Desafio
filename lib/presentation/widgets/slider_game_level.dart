import 'package:flutter/material.dart';

class SliderGameLevel extends StatelessWidget {
  final int listSize;
  final Function(double levelSelected) onChange;
  final int currentLevel;
  final String label;

  const SliderGameLevel(
      {super.key,
      required this.listSize,
      required this.onChange,
      required this.currentLevel,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Slider(
      label: label,
      value: currentLevel.toDouble(),
      divisions:listSize -1 ,
      max: listSize.toDouble() -1,
      onChanged: onChange,
    );
  }
}
