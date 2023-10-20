import '3_a.dart';

// 인스턴스화 가능
Parent parent = Parent();

// extend 불가능
class Child1 extends Parent{}

// implement 가능
class Child2 implements Parent{}