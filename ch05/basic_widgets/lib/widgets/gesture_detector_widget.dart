import 'package:basic_widgets/widgets/icon_button_widget.dart';
import 'package:basic_widgets/widgets/outlined_button_widget.dart';
import 'package:flutter/material.dart';

class GestureDetectorWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            // 한 번 탭했을 때 실행할 함수
            onTap: (){
              print('on tap');
            },
            // 두 번 탭했을 때 실행할 함수
            onDoubleTap: ( ){
              print('on double tap');
            },
            // 길게 눌렀을 때 실행할 함수
            onLongPress: (){
              print('on long press');
            },
            // Gesture를 적용할 위젯
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}
