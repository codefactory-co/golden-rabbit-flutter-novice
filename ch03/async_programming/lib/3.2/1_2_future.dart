void main() {
  addNumbers(1, 1);
}

void addNumbers(int number1, int number2){
  print('$number1 + $number2 계산 시작!');

  // ➊ Future.delayed()를 사용하면 일정 시간 후에 콜백 함수를 실행할 수 있음
  Future.delayed(Duration(seconds: 3), (){
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 코드 실행 끝');
}
