import 'package:basic_widgets/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: OutlinedButton(
            // 클릭 시 실행할 함수
            onPressed: () {},
            // 버튼 스타일
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            // 버튼에 들어갈 위젯
            child: Text('아웃라인드 버튼'),
          ),
        ),
      ),
    );
  }
}
