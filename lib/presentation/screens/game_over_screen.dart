import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final int currentNumber;
  final void Function() onTap;
  const GameOverScreen({super.key, required this.currentNumber, required this.onTap, });

  @override
  Widget build(BuildContext context) {
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
            Text('El numero era $currentNumber'),
            const Text('Quieres intentarlo de nuevo?'),
            OutlinedButton(onPressed: onTap, child: const Text('Claro que si!'))
          ],
        ),
      ),
    );
  }
}
