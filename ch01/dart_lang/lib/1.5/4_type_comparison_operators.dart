void main() {
  int number1 = 1;

  print(number1 is int);     // true
  print(number1 is String);  // false
  print(number1 is! int);    // false. !는 반대를 의미합니다(int 타입이 아닌 경우 true).
  print(number1 is! String); // true
}
