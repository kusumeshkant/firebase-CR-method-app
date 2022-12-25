import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/screen_sizer.dart';

class HSpacer extends StatelessWidget {
  const HSpacer({Key? key, this.height = 0, this.heightRatio})
      : super(key: key);
  final double? height;
  final double? heightRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          heightRatio == null ? height : screenHeight(context) * heightRatio!,
    );
  }
}
