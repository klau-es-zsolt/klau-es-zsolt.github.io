import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String label;
  final TextAlign? textAlign;

  const CommonText(this.label, {this.textAlign, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 18.0,
        color: Colors.black87,
      ),
    );
  }
}
