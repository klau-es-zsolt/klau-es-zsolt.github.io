import 'package:flutter/material.dart';
import 'package:wedding_page/ui/theme/colors.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: WeddingColors.backgroundWhite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // invitation text
            Text("Meghívó olvashatatlan szöveg"),
            SizedBox(height: 8.0,),
            Text("Folytatás"),
          ],
        ),
      ),
    );
  }
}
