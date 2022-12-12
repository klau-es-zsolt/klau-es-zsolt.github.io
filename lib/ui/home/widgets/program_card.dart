import 'package:flutter/material.dart';
import 'package:wedding_page/ui/theme/colors.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WeddingColors.backgroundWhite,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return ProgramListItem();
        },
      ),
    );
  }
}

class ProgramListItem extends StatelessWidget {
  const ProgramListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text("Időpont:"),
        Spacer(),
        Text("Program"),
        Spacer(),
      ],
    );
  }
}

