import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:wedding_page/ui/widgets/section_title.dart';
import 'dart:ui' as ui;

class PlaceCard extends StatelessWidget {
  const PlaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 440,
      child: Column(
        children: [
          const SizedBox(height: 8.0,),
          const SectionTitle("Helyszín"),
          Flexible(child: _getMap()),
        ],
      ),
    );
  }

  Widget _getMap() {
    String htmlId = "7";

    final mapOptions = MapOptions()
      ..zoom = 16
      ..center = LatLng(48.103329156859076, 20.388624801851055);

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "400px"
        ..style.border = 'none';

      GMap(elem, mapOptions);

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}
