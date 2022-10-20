void main() {
  final String name = '블랙핑크';
  name = 'BTS';   // 에러 발생. final로 선언한 변수는 선언 후 값을 변경할 수 없음

  const String name2 = 'BTS';
  name2 = '블랙핑크';  // 에러 발생.  const로 선언한 변수는 선언 후 값을 변경할 수 없음
}
