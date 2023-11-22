import 'package:flutter/material.dart';
import 'package:what_is_riverpod/calculator.dart';

typedef OnChangedCalculator = Function(Calculator calculator);

class ChangeCalculator extends StatelessWidget {
  final num left;
  final num right;
  final OnChangedCalculator onChangedCalculator;

  const ChangeCalculator({
    super.key,
    required this.left,
    required this.right,
    required this.onChangedCalculator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$left',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => onChangedCalculator(Adder()),
              child: const Text('+'),
            ),
            const SizedBox(
              width: 32,
            ),
            ElevatedButton(
              onPressed: () => onChangedCalculator(Multiplier()),
              child: const Text('*'),
            ),
          ],
        ),
        const SizedBox(
          width: 32,
        ),
        Text(
          '$right',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
