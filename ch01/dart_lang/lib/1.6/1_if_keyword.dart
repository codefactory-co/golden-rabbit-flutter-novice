void main() {
  int number = 2;

  if (number % 3 == 0) {
    print('3의 배수입니다.');
  } else if (number % 3 == 1) {
    print('나머지가 1입니다.');
  } else {
    // 조건에 맞지 않기 때문에 다음 코드 실행
    print('맞는 조건이 없습니다.');
  }
}
