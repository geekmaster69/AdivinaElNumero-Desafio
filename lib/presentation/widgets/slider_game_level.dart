import 'package:flutter/material.dart';

class SliderGameLevel extends StatelessWidget {
  const SliderGameLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: 1.0,
      onChanged: (value) {},
    );
  }
}
