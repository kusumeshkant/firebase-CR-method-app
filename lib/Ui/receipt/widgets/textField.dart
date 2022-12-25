import 'package:flutter/material.dart';

import '../../../utilities/textStyles.dart';

class EntryField extends StatefulWidget {
  const EntryField(
      {Key? key,
      required this.labelTxt,
      required this.text,
      required this.controller})
      : super(key: key);
  final String labelTxt;
  final String text;
  final TextEditingController controller;

  @override
  State<EntryField> createState() => _EntryFieldState();
}

class _EntryFieldState extends State<EntryField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 20, bottom: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(.4)),
      child: TextFormField(
        controller: widget.controller,
        style: TextStyles.inter600_10,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: widget.labelTxt,
          labelStyle: TextStyles.inter600_10, // 5.0`
        ),
      ),
    );
  }
}
