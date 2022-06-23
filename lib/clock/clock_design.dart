import 'package:flutter/material.dart';
import 'package:analog_clock_flutter/components/analog_design.dart';
import 'package:analog_clock_flutter/components/background_text.dart';
import 'package:analog_clock_flutter/components/digital_design.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:analog_clock_flutter/abstracts/constants.dart';
import '../helper/responsive.dart';

class ClockDesign extends StatelessWidget {
  const ClockDesign({
    Key? key,
    required this.twentyfour,
    required this.customTheme,
    required DateTime now,
    required String temperature,
    required String condition,
    required String location,
  })  : _now = now,
        super(key: key);

  //this is the constructor for the clockdesign

  final ThemeData customTheme;
  final DateTime _now;
  final twentyfour;

  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return Container(
      color: customTheme.backgroundColor,
      child: Stack(
        children: <Widget>[
          BackgroundText(
            customtheme: customTheme,
            gridsize: Responsive.boxSizeHorizontal,
            twentyfour: twentyfour,
            now: _now,
          ),
          //This is the text that present on the background
          DigitalDesignHour(
            now: _now,
            gridHeight: Responsive.boxSizeVerticle,
            gridWidth: Responsive.boxSizeHorizontal,
            twentyfour: twentyfour,
          ),
          //this is the digitel hour displayed
          //You can find the file on ../components/digital_design.dart
          DigitalDesignMinute(
            now: _now,
            gridHeight: Responsive.boxSizeVerticle,
            gridWidth: Responsive.boxSizeHorizontal,
          ),
          //this is the digitel minute displayed
          //You can find the file on ../components/digital_design.dart
          Center(
            child: SvgPicture.asset(
              //SvgPicture is a flutter package that renders a vector svg image
              // I use a vector image called clockbackground.svg
              //You can find the image on ../assets/
              Theme.of(context).brightness == Brightness.light
                  ? kclockBackgroundlight
                  : kclockBackgrounddark,
              // this is a constant on ../abstract/constants.dart file
              height: Responsive.boxSizeHorizontal * 40,
              width: Responsive.boxSizeHorizontal * 40,
              fit: BoxFit.contain,
            ),
          ),
          AnalogDesign(
            customTheme: customTheme,
            now: _now,
            gridHeight: Responsive.boxSizeVerticle,
            gridWidth: Responsive.boxSizeHorizontal, key: null,
          ),
          //this widgit contain all the component for hour,minute and second hand rendering.
          // _now gives the current time

          // Weather(temperature: _temperature, condition: _condition),
          // Location(location: _location),
        ],
      ),
    );
  }
}
