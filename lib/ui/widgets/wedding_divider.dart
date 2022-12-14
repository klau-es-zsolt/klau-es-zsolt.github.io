import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding_page/ui/theme/colors.dart';

class WeddingDivider extends StatelessWidget {
  final EdgeInsets? padding;

  const WeddingDivider({Key? key})
      : padding = null,
        super(key: key);

  const WeddingDivider.padding({
    Key? key,
    this.padding = const EdgeInsets.symmetric(vertical: 24.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      child: SvgPicture.asset(
          "images/divider.svg",
          semanticsLabel: "Divider",
          color: WeddingColors.dividerGreen,
          height: 32,
      )
    );
  }
}
