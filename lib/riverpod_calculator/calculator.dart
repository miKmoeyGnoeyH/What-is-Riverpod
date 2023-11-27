abstract class Calculator {
  num compute(num a, num b);
}

class Adder implements Calculator {
  @override
  num compute(num a, num b) {
    return a + b;
  }
}

class Multiplier implements Calculator {
  @override
  num compute(num a, num b) {
    return a * b;
  }
}
