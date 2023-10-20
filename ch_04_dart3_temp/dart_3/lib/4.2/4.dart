void main() {
  final minJiIdol = Idol(name: '민지', age: 19);

  final Idol(name: name3, age: age3) = minJiIdol;

  // 민지 출력
  print(name3);

  // 19 출력
  print(age3);
}

class Idol {
  final String name;
  final int age;

  Idol({
    required this.name,
    required this.age,
  });
}

