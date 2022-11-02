import 'package:flutter/material.dart';

class EmoticonSticker extends StatefulWidget {
  // ➊ 스티커를 그리는 위젯
  final VoidCallback onTransform; // ➏
  final String imgPath; // ➋ 이미지 경로
  final bool isSelected;

  const EmoticonSticker({
    required this.onTransform,
    required this.imgPath,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<EmoticonSticker> createState() => _EmoticonStickerState();
}

class _EmoticonStickerState extends State<EmoticonSticker> {
  // 확대/축소 배율
  double scale = 1;

  // 가로의 움직임
  double hTransform = 0;

  // 세로의 움직임
  double vTransform = 0;

  // 위젯의 초기 크기 기준 확대/축소 배율
  double actualScale = 1;

  @override
  Widget build(BuildContext context) {
    return Transform(
      // ➊ child 위젯을 변형할 수 있는 위젯
      transform: Matrix4.identity()
        ..translate(hTransform, vTransform) // ➋ 상/하 움직임 정의
        ..scale(scale, scale), // ➌ 확대/축소 정의

      // 기존 작성해둔 Container 위젯
      child: Container(
        decoration: widget.isSelected // ➊ 선택 상태일 때만 테두리 색상 구현
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(4.0), // 모서리 둥글게
                border: Border.all(
                  // 테두리 파란색
                  color: Colors.blue,
                  width: 1.0,
                ),
              )
            : BoxDecoration(
                // 테두리는 투명이나 너비는 1로 설정해서 스티커가 선택 취소될 때 깜빡이는 현상 제거
                border: Border.all(
                  width: 1.0,
                  color: Colors.transparent,
                ),
              ),

        // 기존에 작성해둔 GestureDetector
        child: GestureDetector(
          onTap: () {
            // ➌ 스티커를 눌렀을 때 실행할 함수
            widget.onTransform(); // ➏ 스티커의 상태가 변경될 때마다 실행
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            // ➍ 스티커의 확대 비율이 변경됐을 때 실행
            setState(() {
              scale =
                  details.scale * actualScale; // ➋ 최근 확대 비율 기반으로 실제 확대 비율 계산
              vTransform += details.focalPointDelta.dy; // ➌ 세로 이동 거리 계산
              hTransform += details.focalPointDelta.dx; // ➌ 가로 이동 거리 계산
            });
          },
          onScaleEnd: (ScaleEndDetails details) {
            actualScale = scale; // ➊ 확대 비율 저장
          }, // ➎ 스티커의 확대 비율 변경이 완료됐을 때 실행
          child: Image.asset(
            widget.imgPath, // ➋
          ),
        ),
      ),
    );
  }
}
