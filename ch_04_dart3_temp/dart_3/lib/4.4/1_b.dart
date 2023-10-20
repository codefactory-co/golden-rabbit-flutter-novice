import '1_a.dart';

// 인스턴스화 가능
Parent parent = Parent();

// 가능
base class Child extends Parent{}

// subtype of base or final is not base final or sealed 에러
// base / sealed / final modifier중 하나 필요
class Child2 extends Parent{}

// subtype of base or final is not base final or sealed 에러
// base 클래스는 implement 불가능
class Child3 implements Parent{}
