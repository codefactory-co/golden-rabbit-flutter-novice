void main() {
  List<String> blackPinkList = ['리사', '지수', '제니', '로제'];

  final allMembers = blackPinkList.reduce((value, element) => value + ', ' + element);  // ➊ 리스트를 순회하며 값들을 더합니다.

  print(allMembers);
}
