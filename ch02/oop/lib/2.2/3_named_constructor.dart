class Idol {
  final String name;
  final int membersCount;

  // ❶ 생성자
  Idol(String name, int membersCount)
  // 1개 이상의 변수를 저장하고 싶을 때는 , 기호로 연결해주면 됩니다.
      : this.name = name,
        this.membersCount = membersCount;

  // ❷ 네임드 생성자
  // {클래스명.네임드 생성자명} 형식
  // 나머지 과정은 기본 생성자와 같습니다.
  Idol.fromMap(Map<String, dynamic> map)
      : this.name = map['name'],
        this.membersCount = map['membersCount'];

  void sayName() {
    print('저는 ${this.name}입니다. ${this.name} 멤버는 ${this.membersCount}명입니다.');
  }
}

void main() {
  // 기본 생성자 사용
  Idol blackPink = Idol('블랙핑크', 4);
  blackPink.sayName();

  // fromMap이라는 네임드 생성자 사용
  Idol bts = Idol.fromMap({
    'name': 'BTS',
    'membersCount': 7,
  });
  bts.sayName();
}
