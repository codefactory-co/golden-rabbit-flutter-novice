void main() {
  Map<String, String> dictionary = {
    'Harry Potter': '해리 포터',
    'Ron Weasley': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저',
  };

  print(dictionary.keys);
  // Iterable이 반환되기 때문에 .toList()를 실행해서 List를 반환받을 수도 있음
  print(dictionary.values);
}
