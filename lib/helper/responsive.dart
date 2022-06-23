import 'package:flutter/widgets.dart';

class Responsive {
  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late double boxSizeHorizontal;
  static late double boxSizeVerticle;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    boxSizeHorizontal = screenWidth / 100;
    boxSizeVerticle = screenHeight / 100;
  }
}

//Manupulating digital clock font depending on the screensize
class DigitalClockFont {
  final double? gridwidth;
  DigitalClockFont({this.gridwidth});
  double fontsize() {
    //this resize the font linearly according to the device width
    return gridwidth! * 15;
  }
}

class DigitalBackgroundFont {
  final double? gridwidth;
  DigitalBackgroundFont({this.gridwidth});
  double fontsize() {
    //this resize the font linearly according to the device width
    return gridwidth! * 23;
  }
}