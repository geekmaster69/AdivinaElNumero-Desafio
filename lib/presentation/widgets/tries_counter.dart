import 'package:flutter/material.dart';

class TriesCounter extends StatelessWidget {
  final int remainingTries;
  const TriesCounter({super.key, required this.remainingTries});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: colors.onSurface), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const Text('Intentos'), Text('$remainingTries')],
      ),
    );
  }
}
