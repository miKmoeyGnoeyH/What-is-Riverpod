import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_is_riverpod/riverpod_calculator/calculator.dart';

final provider = StateProvider<Calculator>((ref) => Adder());
