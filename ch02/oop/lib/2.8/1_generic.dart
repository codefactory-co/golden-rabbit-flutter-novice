// 인스턴스화할 때 입력받을 타입을 T로 지정합니다.
class Cache<T> {
  // data의 타입을 추후 입력될 T 타입으로 지정합니다.
  final T data;

  Cache({
    required this.data,
  });
}

void main() {
  // T의 타입을 List<int>로 입력합니다.
  final cache = Cache<List<int>>(
    data: [1,2,3],
  );

  // 제네릭에 입력된 값을통해 data 변수의 타입이 자동으로 유추됩니다.
  // reduce() 함수가 기억나지 않는다면 1.3.1절 List타입의 reduce() 함수를 복습해보세요.
  print(cache.data.reduce((value, element) => value + element));
}
