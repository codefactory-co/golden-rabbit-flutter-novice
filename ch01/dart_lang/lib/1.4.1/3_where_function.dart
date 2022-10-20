void main() {
  List<String> blackPinkList = ['리사', '지수', '제니', '로제'];

  final newList = blackPinkList.where(
        (name) => name == '리사' || name == '지수',  // ‘리사’ 또는 ‘지수’만 유지
  );

  print(newList);
  print(newList.toList()); // Iterable을 List로 다시 변환할 때  .toList() 사용
}
