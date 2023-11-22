import 'package:flutter/material.dart';
import 'package:what_is_riverpod/calculator.dart';

class CalculatorResult extends StatelessWidget {
  final num left;
  final num right;
  final Calculator calculator;

  const CalculatorResult({
    super.key,
    required this.left,
    required this.right,
    required this.calculator,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$left ${calculator is Adder ? '+' : '*'} $right = ${calculator.compute(left, right)}',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
