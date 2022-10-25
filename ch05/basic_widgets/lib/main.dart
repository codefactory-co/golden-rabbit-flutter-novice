import 'package:basic_widgets/widgets/column_widget.dart';
import 'package:basic_widgets/widgets/elevated_button_widget.dart';
import 'package:basic_widgets/widgets/expanded_widget.dart';
import 'package:basic_widgets/widgets/floating_action_button_widget.dart';
import 'package:basic_widgets/widgets/gesture_detector_widget.dart';
import 'package:basic_widgets/widgets/icon_button_widget.dart';
import 'package:basic_widgets/widgets/outlined_button_widget.dart';
import 'package:basic_widgets/widgets/padding_widget.dart';
import 'package:basic_widgets/widgets/row_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ColumnWidgetExample(),
        ),
      ),
    );
  }
}
