import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String label;

  const FormLabel(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 18.0,
        color: Colors.black87,
      ),
    );
  }
}
