import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class CounterWidget extends StatelessWidget {
  
  
  final List<ResultEntity> numbers;
  final String title;
  const CounterWidget(
      {super.key,
   
      required this.numbers,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Flexible(
      child: Container(
        margin: const EdgeInsets.all(8),
     
        decoration: BoxDecoration(
            border: Border.all(color: colors.onSurface), borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Text(title),
            Expanded(
              child: ListView.builder(
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  final item = numbers[index];

                  return Center(
                      child: Text(
                    '${item.number}',
                    style: TextStyle(color: item.color),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
