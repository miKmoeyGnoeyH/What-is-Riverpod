import 'package:flutter/material.dart';
import 'package:what_is_riverpod/riverpod_calculator/calculator_result.dart';
import 'package:what_is_riverpod/riverpod_calculator/change_calculator.dart';

class HomeScreen extends StatelessWidget {
  //Calculator calculator = Adder();
  final num left = 1;
  final num right = 9;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange[300],
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.amber[300],
                child: const CalculatorResult(
                  left: left,
                  right: right,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green[300],
                child: const ChangeCalculator(
                  left: left,
                  right: right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
