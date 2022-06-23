import 'package:analog_clock_flutter/clock/core_calculation.dart';
import 'package:analog_clock_flutter/helper/drawn_hand.dart';
import 'package:flutter/material.dart';
import '../abstracts/constants.dart';

class AnalogDesign extends StatelessWidget {
  const AnalogDesign({
    required Key? key,
    required this.customTheme,
    required DateTime now,
    this.gridHeight,
    this.gridWidth,
  })  : _now = now,
        super(key: key);

  final ThemeData customTheme;
  final DateTime _now;
  final gridWidth;
  final gridHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawnHand(
          //this is the second hand
          color: Colors.red,
          thickness: 7,
          size: gridWidth * 1,
          angleRadians: _now.second * radiansPerTick,
        ),
        DrawnHand(
          //this is the minute hand
          color: customTheme.primaryColor,
          thickness: 7,
          size: gridWidth * 0.9,
          angleRadians: _now.minute * radiansPerTick,
        ),
        DrawnHand(
          //this is the hour hand
          color: customTheme.primaryColor,
          thickness: 7,
          size: gridWidth * 0.7,
          angleRadians:
          _now.hour * radiansPerHour + (_now.minute / 60) * radiansPerHour,
        ),
        Center(
          /*this is the center tip of the watch */
          child: Container(
            height: gridHeight * 5,
            width: gridHeight * 5,
            decoration: BoxDecoration(
              color: koutercircle,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Center(
          child: Container(
            height: gridHeight * 2,
            width: gridHeight * 2,
            decoration: BoxDecoration(
              color: kinnercircle,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
