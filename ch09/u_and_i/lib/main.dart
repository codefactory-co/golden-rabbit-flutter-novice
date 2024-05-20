import 'package:u_and_i/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        // ➊ 테마를 지정할 수 있는 클래스
        fontFamily: 'sunflower', // 기본 글씨체
        extensions: [
          // ➋ 글짜 테마를 적용할 수 있는 클래스
          CustomTextTheme(
              // deprecated 사항 반영한 Text Theme
              headline1: const TextStyle(
                //  headline1 스타일 정의
                color: Colors.white, //  글 색상
                fontSize: 80.0, //  글 크기
                fontWeight: FontWeight.w700, //  글 두께
                fontFamily: 'parisienne', //  글씨체
              ),
              headline2: const TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),
              bodyText1: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
              bodyText2: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ))
        ],
      ),
      home: HomeScreen(),
    ),
  );
}

class CustomTextTheme extends ThemeExtension<CustomTextTheme> {
  final TextStyle? headline1;
  final TextStyle? headline2;
  final TextStyle? bodyText1;
  final TextStyle? bodyText2;

  CustomTextTheme({
    required this.headline1,
    required this.headline2,
    required this.bodyText1,
    required this.bodyText2,
  });

  @override
  CustomTextTheme copyWith({
    TextStyle? headline1,
    TextStyle? headline2,
    TextStyle? bodyText1,
    TextStyle? bodyText2,
  }) {
    return CustomTextTheme(
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      bodyText1: bodyText1 ?? this.bodyText1,
      bodyText2: bodyText2 ?? this.bodyText2,
    );
  }

  @override
  CustomTextTheme lerp(ThemeExtension<CustomTextTheme>? other, double t) {
    if (other is! CustomTextTheme) {
      return this;
    }
    return CustomTextTheme(
      bodyText1: TextStyle.lerp(bodyText1, other.bodyText1, t),
      bodyText2: TextStyle.lerp(bodyText2, other.bodyText2, t),
      headline1: TextStyle.lerp(headline1, other.headline1, t),
      headline2: TextStyle.lerp(headline2, other.headline2, t),
    );
  }
}
