import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateTimeStateNotifierProvider =
/**StateNotifierProvider 생성자에 전달할 함수는 StateNotifier를 상속받아 구현한 클래스의 타입이어야 함
 * StateNotifierProvider 생성자는 두 제네릭 타입을 전달받음
 * 첫 번째 제네릭 인자는 StateNotifier를 상속받은 클래스
 * 두 번째 제네릭 인자는 첫 번째 인자로 전달된 StateNotifier를 상속받은 클래스가 처리하는 상태의 타입(이 예제에서는 DateTime?)
 */
    StateNotifierProvider<DateStateNotifier, DateTime?>(
        (ref) => DateStateNotifier());
final dateTimeProvider =
    ChangeNotifierProvider((ref) => DateTimeChangeNotifierProvider());

class DateStateNotifier extends StateNotifier<DateTime?> {
  ///DateTime?을 상태로 관리하려면 StateNotifier<DateTime?>를 상속받는 클래스를 선언
  ///생성자 호출 시 super 생성자를 호출하며 기본 상태인 null을 전달하는 생성자 구현
  DateStateNotifier() : super(null);

  set(DateTime dateTime) {
    state = dateTime;
  }
}

class DateTimeChangeNotifierProvider extends ChangeNotifier {
  DateTime? dateTime;
  DateTime? get getDateTime => dateTime;

  DateTimeChangeNotifierProvider() : dateTime = null;

  selectDate(DateTime? pickedDate) {
    dateTime = pickedDate;
    notifyListeners();
  }
}
