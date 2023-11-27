import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_is_riverpod/riverpod_calculator/calculator.dart';
import 'package:what_is_riverpod/riverpod_calculator/provider.dart';

class ChangeCalculator extends ConsumerWidget {
  final num left;
  final num right;

  const ChangeCalculator({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onPressed: () {
                ref.read(provider.notifier).update((state) => Adder());
              },
              child: const Text('+'),
            ),
            const SizedBox(
              width: 32,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(provider.notifier).update((state) => Multiplier());
              },
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
