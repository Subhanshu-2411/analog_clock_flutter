import 'package:flutter/material.dart';
import '../helper/responsive.dart';

class DigitalDesignHour extends StatelessWidget {
  const DigitalDesignHour({
    required DateTime now,
    this.gridHeight,
    this.gridWidth,
    this.twentyfour,
  }) : _now = now;

  final DateTime _now;
  final gridHeight;
  final gridWidth;
  final twentyfour;
  @override
  Widget build(BuildContext context) {
    int hour;
    if (twentyfour == false && _now.hour > 12) {
      hour = _now.hour - 12;
    } else {
      hour = _now.hour;
    }
    DigitalClockFont fontsize = DigitalClockFont(gridwidth: gridWidth);
    return Center(
      child: Transform.translate(
        offset: Offset(-gridWidth * 25, 0),
        //this position the text in the stack
        child: Text(
          //this is the ternery operator that add a zero if the digit is in single number
          hour.toString().length == 1 ? '0$hour' : '$hour',
          style: TextStyle(
            fontSize: fontsize.fontsize(),
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class DigitalDesignMinute extends StatelessWidget {
  const DigitalDesignMinute({
    required DateTime now,
    this.gridHeight,
    this.gridWidth,
  }) : _now = now;

  final DateTime _now;
  final gridHeight;
  final gridWidth;

  @override
  Widget build(BuildContext context) {
    DigitalClockFont fontsize = DigitalClockFont(gridwidth: gridWidth);
    return Center(
      child: Transform.translate(
        offset: Offset(gridWidth * 26, 0),
        //this position the text in the stack
        child: Text(
          //this is the ternery operator that add a zero if the digit is in single number
          _now.minute.toString().length == 1
              ? '0${_now.minute}'
              : '${_now.minute}',
          style: TextStyle(
            fontSize: fontsize.fontsize(),
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
