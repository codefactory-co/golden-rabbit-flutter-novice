// ❶ abstract 키워드를 사용해 추상 클래스 지정
abstract class Idol {
  final String name;
  final int membersCount;

  Idol(this.name, this.membersCount); // ❷ 생성자 선언

  void sayName();          // ❸ 추상 메서드 선언
  void sayMembersCount();  // ➍ 추상 메서드 선언
}

// implements 키워드를 사용해 추상 클래스를 구현하는 클래스
class GirlGroup implements Idol {
  final String name;
  final int membersCount;

  GirlGroup(
      this.name,
      this.membersCount,
      );

  void sayName() {
    print('저는 여자 아이돌 ${this.name}입니다.');
  }

  void sayMembersCount() {
    print('${this.name} 멤버는 ${this.membersCount}명입니다.');
  }
}

void main() {
  GirlGroup redVelvet = GirlGroup('블랙핑크', 4);

  redVelvet.sayName();
  redVelvet.sayMembersCount();
}
