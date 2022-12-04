import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white70,
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
