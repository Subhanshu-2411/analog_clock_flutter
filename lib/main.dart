import 'package:flutter/material.dart';
import 'dart:io';
import 'package:analog_clock_flutter/flutter_clock_helper/customizer.dart';
import 'package:analog_clock_flutter/flutter_clock_helper/model.dart';
import 'package:flutter/foundation.dart';
import 'clock/core_calculation.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // A temporary measure until Platform supports web and TargetPlatform supports
  if (!kIsWeb && Platform.isMacOS) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
  await SystemChrome.setPreferredOrientations(
    //as the clock orientation should be in landscape mode,
    //following lines of code force the app into landscape mode.
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    ClockCustomizer((ClockModel model) => AnalogClock(model)),
    //Analog clock is under [clock/core_calculation.dart] file
  );
}