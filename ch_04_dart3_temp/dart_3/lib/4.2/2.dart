void main() {
  final numbers = [1, 2, 3, 4, 5, 6, 7, 8];

  // spread operator를 사용하게 되면 중간의 값들을 버릴 수 있다.
  final [x, y, ..., z] = numbers;

  // 1 출력
  print(x);

  // 2 출력
  print(y);

  // 8 출력
  print(z);
}
