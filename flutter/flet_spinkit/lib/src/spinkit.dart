import 'package:flet/flet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitControl extends StatelessWidget {
  final Control? parent;
  final Control control;

  const SpinkitControl({
    super.key,
    required this.parent,
    required this.control,
  });

  @override
  Widget build(BuildContext context) {
    var color = control.attrColor("color", context);
    var size = control.attrDouble("size", 50)!;
    var spinkitType = control.attrString("spinkitType");
    var duration = parseDuration(control, "duration");
    late Widget spinkitWidget;

    switch (spinkitType?.toLowerCase()) {
      case "rotatingcircle":
        spinkitWidget = SpinKitRotatingCircle(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 1200),
        );
        break;
      case "foldingcube":
        spinkitWidget = SpinKitFoldingCube(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 2400),
        );
        break;
      case "doublebounce":
        spinkitWidget = SpinKitDoubleBounce(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 2000),
        );
        break;
      case "wave":
        spinkitWidget = SpinKitWave(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 1200),
        );
        break;
      case "wanderingcubes":
        spinkitWidget = SpinKitWanderingCubes(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 1800),
        );
        break;
      case "circle":
        spinkitWidget = SpinKitCircle(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 1200),
        );
        break;
      case "fadingcircle":
        spinkitWidget = SpinKitFadingCircle(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 1200),
        );
        break;
      case "dancingsquare":
        spinkitWidget = SpinKitDancingSquare(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 1200),
        );
        break;
      case "chasingdots":
        spinkitWidget = SpinKitChasingDots(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 2000),
        );
        break;
      case "threebounce":
        spinkitWidget = SpinKitThreeBounce(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 1400),
        );
        break;
      case "fadingfour":
        spinkitWidget = SpinKitFadingFour(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 1200),
        );
        break;
      case "pumpingheart":
      default:
        spinkitWidget = SpinKitPumpingHeart(
          color: color,
          size: size,
          duration: duration ?? const Duration(milliseconds: 2400),
        );
    }

    return constrainedControl(context, spinkitWidget, parent, control);
  }
}
