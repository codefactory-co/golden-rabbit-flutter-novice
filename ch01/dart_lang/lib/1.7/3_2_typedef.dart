typedef Operation = void Function(int x, int y);

void add(int x, int y) {
  print('결괏값 : ${x + y}');
}

void subtract(int x, int y) {
  print('결괏값 : ${x - y}');
}

void main() {
  // typedef는 일반적인 변수의 type처럼 사용 가능
  Operation oper = add;
  oper(1, 2);

  // subtract() 함수도 Operation에 해당되는
  // 시그니처이므로 oper 변수에 저장 가능
  oper = subtract;
  oper(1, 2);
}
