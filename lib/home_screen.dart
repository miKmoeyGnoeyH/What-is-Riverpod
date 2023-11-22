import 'package:flutter/material.dart';
import 'package:what_is_riverpod/calculator.dart';
import 'package:what_is_riverpod/calculator_result.dart';
import 'package:what_is_riverpod/change_calculator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Calculator calculator = Adder();
  final num left = 1;
  final num right = 9;

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
                child: CalculatorResult(
                  left: left,
                  right: right,
                  calculator: calculator,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green[300],
                child: ChangeCalculator(
                  left: left,
                  right: right,
                  onChangedCalculator: (calculator) {
                    setState(() {
                      this.calculator = calculator;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
