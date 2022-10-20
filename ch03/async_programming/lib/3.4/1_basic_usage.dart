import 'dart:async';

void main() {
  final controller = StreamController();  // StreamController 선언
  final stream = controller.stream;  // Stream 가져오기

  // Stream에 listen() 함수를 실행하면 값이 주입될 때마다 콜백 함수를 실행할 수 있습니다.
  final streamListener1 = stream.listen((val) {
    print(val);
  });

  // Stream에 값을 주입할 때는 sink.add() 함수를 실행하면 됩니다.
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
}
