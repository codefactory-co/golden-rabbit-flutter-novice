import 'package:random_dice/const/colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final double threshold;  // Slider의 현잿값

  // Slider가 변경될 때마다 실행되는 함수
  final ValueChanged<double> onThresholdChange;

  const SettingsScreen({
    Key? key,

    // threshold와 onThresholdChange는 SettingsScreen에서 입력
    required this.threshold,
    required this.onThresholdChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Text(
                '민감도',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Slider(
          min: 0.1,  // ➊ 최솟값
          max: 10.0,  // ➋ 최댓값
          divisions: 101,  // ➌ 최솟값과 최댓값 사이 구간 개수
          value: threshold,  // ➍ 슬라이더 선택값
          onChanged: onThresholdChange,  // ➎ 값 변경 시 실행되는 함수
          label: threshold.toStringAsFixed(1),  // ➏ 표싯값
        ),
      ],
    );
  }
}
