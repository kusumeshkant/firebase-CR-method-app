import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/textStyles.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.lable,
    this.onTap,
  });
  final String lable;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber.withOpacity(.35)),
        child: Center(
            child: Text(
          lable,
          style: TextStyles.inter600_15,
        )),
      ),
    );
  }
}
