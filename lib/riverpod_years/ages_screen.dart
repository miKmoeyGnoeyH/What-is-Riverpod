import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_is_riverpod/riverpod_years/birth_provider.dart';

///StateProvider를 StateNotifierProvider로 변경하면
///update를 StateNotifier를 상속받은 클래스로 옮겨 상태 변경을 객체지향적으로 제어할 수 있지만
///여전히 read나 watch로 가져온 상태를 화면에 적용하는 로직은 UI로직과 뒤섞여 있음
///
///ChangeNotifierProvider는 immutable하게 상태를 관리하는 StateNotifierProvider과 달리
///mutable한 복잡한 상태 관리에 적합함
///StateNotifierProvider는 StateNotifier를 상속받는 상태 객체를 사용
///ChangeNotifierProvider는 ChangeNotifier를 상속받는 상태 객체 사용
///
///immutable 객체는 외부에서 접근해 값을 변경하는 것을 허용하지 않음
///값이 변경될 때마다 새로운 값으로 객체를 새로 생성함

class AgesScreen extends ConsumerWidget {
  const AgesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /**사용자가 입력한 생년월일 상태가 변경되면 위젯을 다시 빌드,
     * 설정한 생년월일의 상태에 따라 로직을 구현
     */
    /**StateProvider를 사용했을 때 */
    //final birth = ref.watch<DateTime?>(dateTimeProvider);

    /**StateNotifierProvider를 사용했을 때 */
    final birth = ref.watch(dateTimeProvider).dateTime;
    final existBirth = birth != null;

    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _createHeader(existBirth),
            if (!existBirth) _createInsertBirth(context, birth, ref),
            if (existBirth) _createBirth(context, birth, ref),
            if (existBirth) const SizedBox(height: 32.0),
            if (existBirth) _createResults(birth),
          ],
        )),
      ),
    );
  }
}

Widget _createHeader(bool existBirth) {
  var emoji = const Text(
    '🥳',
    style: TextStyle(
      fontSize: 40,
    ),
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      emoji,
      const SizedBox(width: 8.0),
      _createDefaultTitle(existBirth ? '아리송한 나이를 한 방에' : '생년월일을 입력해 주세요'),
      const SizedBox(width: 8.0),
      emoji,
    ],
  );
}

Text _createDefaultTitle(String title,
    {Color color = Colors.white, FontWeight fontWeight = FontWeight.w500}) {
  return Text(
    title,
    style: TextStyle(
      color: color,
      fontSize: 20,
      fontWeight: fontWeight,
    ),
  );
}

Widget _createInsertBirth(
    BuildContext context, DateTime? birth, WidgetRef ref) {
  return ElevatedButton(
    onPressed: () {
      _selectDate(context, birth, ref);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90.0),
      child: _createDefaultTitle(
        '입력하기',
        color: Colors.blueAccent,
      ),
    ),
  );
}

Widget _createBirth(BuildContext context, DateTime birth, WidgetRef ref) {
  return GestureDetector(
    onTap: () {
      _selectDate(context, birth, ref);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _createDefaultTitle(
            '${birth.year}년 ${birth.month.toString().padLeft(2, '0')}월 ${birth.day.toString().padLeft(2, '0')}일일',
            fontWeight: FontWeight.w500),
        const SizedBox(width: 8.0),
        const Icon(
          Icons.edit_calendar_rounded,
          color: Colors.white,
          size: 30,
        ),
      ],
    ),
  );
}

Widget _createResults(DateTime birth) {
  final ageYears = DateTime.now().difference(birth).inDays / 365;
  final yearsGap = DateTime.now().year - birth.year;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _createDefaultTitle('만 나이 ${ageYears.toInt()}살'),
      const SizedBox(height: 8.0),
      _createDefaultTitle('세는 나이 ${yearsGap + 1}살'),
      const SizedBox(height: 8.0),
      _createDefaultTitle('연 나이 $yearsGap살'),
    ],
  );
}

void _selectDate(BuildContext context, DateTime? birth, WidgetRef ref) async {
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );

  if (pickedDate != null) {
    /**StateProvider를 사용했을 때 */
    //ref.read(dateTimeProvider.notifier).update((state) => pickedDate);

    /**StateNotifierProvider를 사용했을 때 */
    ref.read(dateTimeProvider.notifier).selectDate(pickedDate);

    /**StateProvider는 ref.read()를 호출하며 프로바이더의 notifier를 전달했을 때 반환하는 값이 StateController
     * StateController를 통해 update() 메소드 호출, update() 메소드에서 새로운 상태를 반환
     * 
     * StateNotifierProvider는 read에 notifier를 전달한 경우 StateNotifier를 상속받은 DateStateNotifier를 반환
     * DateStateNotifier에 사용자가 선택한 DateTime을 전달해 state를 변경하는 메소드를 구현
     * >> 상태를 변경하는 로직을 Widget 내부에서 외부로 분리할 수 있게 됨
     */
  }
}
