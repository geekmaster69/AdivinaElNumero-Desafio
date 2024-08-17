import 'package:flutter/material.dart';

class TriesCounter extends StatelessWidget {
  const TriesCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(16)),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Intentos'), Text('5')],
      ),
    );
  }
}
