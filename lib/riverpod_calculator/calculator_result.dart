import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_is_riverpod/riverpod_calculator/calculator.dart';
import 'package:what_is_riverpod/riverpod_calculator/provider.dart';

class CalculatorResult extends ConsumerWidget {
  final num left;
  final num right;

  const CalculatorResult({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    return Center(
      child: Text(
        '$left ${state is Adder ? '+' : '*'} $right = ${state.compute(left, right)}',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
