import 'package:flutter/material.dart';

import 'package:wedding_page/ui/widgets/common_text.dart';

class FormLabel extends StatelessWidget {
  final String label;

  const FormLabel(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonText(label);
  }
}
