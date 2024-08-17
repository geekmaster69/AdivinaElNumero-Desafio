import 'package:flutter/material.dart';

class TriesCounter extends StatelessWidget {
  final int remainingTries;
  const TriesCounter({super.key, required this.remainingTries});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const Text('Intentos'), Text('$remainingTries')],
      ),
    );
  }
}
