void main() {
  List<String> blackPinkList = ['리사', '지수', '제니', '로제'];

  final newBlackPink = blackPinkList.map(
        (name) => '블랙핑크 $name',  // 리스트의 모든 값 앞에 ‘블랙핑크’를 추가
  );
  print(newBlackPink);

  // Iterable을 List로 다시 변환하고 싶을 때 .toList() 사용
  print(newBlackPink.toList());
}
