import 'package:flutter/material.dart';
import 'package:random_dice/screen/home_screen.dart';
import 'package:random_dice/const/colors.dart';
import 'package:random_dice/screen/root_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        sliderTheme: SliderThemeData(  // Slider 위젯 관련
          thumbColor: primaryColor,    // 동그라미 색
          activeTrackColor: primaryColor,  // 이동한 트랙 색

          // 아직 이동하지 않은 트랙 색
          inactiveTrackColor: primaryColor.withOpacity(0.3),         ),
        // BottomNavigationBar 위젯 관련
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,     // 선택 상태 색
          unselectedItemColor: secondaryColor, // 비선택 상태 색
          backgroundColor: backgroundColor,    // 배경 색
        ),
      ),
      home: RootScreen(),
    ),
  );
}
