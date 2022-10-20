typedef Operation = void Function(int x, int y);

void add(int x, int y) {
  print('결괏값 : ${x + y}');
}

void calculate(int x, int y, Operation oper) {
  oper(x, y);
}

void main() {
  calculate(1, 2, add);
}
