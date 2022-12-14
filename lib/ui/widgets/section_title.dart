import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color? color;
  const SectionTitle(this.title, {Key? key, this.color,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: color,
        ),
      ),
    );
  }
}
