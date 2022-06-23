import 'package:flutter/material.dart';
import 'package:analog_clock_flutter/abstracts/constants.dart';
import '../abstracts/constants.dart';
import '../helper/responsive.dart';

class BackgroundText extends StatelessWidget {
  BackgroundText({required this.customtheme, this.gridsize, required this.twentyfour, required this.now});
  final ThemeData customtheme;
  final gridsize; //this is the gridwidth
  final bool twentyfour;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    String displaytext = "";
    DigitalBackgroundFont font = DigitalBackgroundFont(gridwidth: gridsize);
    if (twentyfour == false && now.hour < 12) {
      displaytext = 'AM';
    } else if (twentyfour == false && now.hour >= 12) {
      displaytext = 'PM';
    } else {
      displaytext = 'Time';
    }
    return Positioned(
      top: -gridsize * 2,
      right: -gridsize * 6,
      //the position change with the screensize
      // I try to make it as responsive as I can make
      child: Text(
        displaytext,
        style: TextStyle(
          fontSize: font.fontsize(),
          fontFamily: kfont,
          fontWeight: FontWeight.w900,
          color: customtheme.colorScheme.secondary,
        ),
      ),
    );
  }
}
