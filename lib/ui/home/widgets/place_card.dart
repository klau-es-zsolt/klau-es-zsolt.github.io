import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:wedding_page/ui/widgets/section_title.dart';
import 'dart:ui' as ui;

class PlaceCard extends StatelessWidget {
  const PlaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle("Helyszín"),
        SizedBox(
          width: double.infinity,
          height: 400,
          child: Column(
            children: [
              Flexible(child: _getMap()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getMap() {
    String htmlId = "map";

    final mapOptions = MapOptions()
      ..scrollwheel = false
      ..zoom = 16
      ..center = LatLng(48.103329156859076, 20.388624801851055);

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "400px"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      final iw = InfoWindow(
        InfoWindowOptions()
          ..position = LatLng(48.103329156859076, 20.388624801851055)
          ..content = 'Szalajka Fogadó'

      );
      iw.open(map);

      var marker = Marker(
          MarkerOptions()
            ..position = LatLng(48.103329156859076, 20.388624801851055)
            ..title = "Szalajka Fogadó"
            ..map = map
      );

      marker.onClick.listen((event) {
        marker.visible = false;
        iw.open(map);
      });

      iw.onCloseclick.listen((event) {
        marker.visible = true;
      });

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}
