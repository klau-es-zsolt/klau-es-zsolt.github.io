import 'package:flutter/material.dart';
import 'package:wedding_page/ui/widgets/section_title.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            SectionTitle("Meghívó"),
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
