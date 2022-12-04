import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      color: Theme.of(context).primaryColorDark.withOpacity(0.7),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Térkép"),
          )
        ],
      ),
    );
  }
}
