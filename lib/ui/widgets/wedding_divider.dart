import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding_page/ui/theme/colors.dart';

class WeddingDivider extends StatelessWidget {
  const WeddingDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: SvgPicture.asset(
          "images/divider.svg",
          semanticsLabel: "Divider",
          color: WeddingColors.dividerGreen,
          height: 32,
      )
    );
  }
}
