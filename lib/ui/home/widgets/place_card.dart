import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

import 'package:wedding_page/ui/widgets/wedding_divider.dart';
import 'package:wedding_page/ui/widgets/section_title.dart';

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
        const WeddingDivider(),
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
          ..content = DivElement()
            ..content = """
              <div class="info-text">
                <p>Szalajka Fogadó</p>
                <p>3348 Szilvásvárad, Egri út 2</p>
              </div>
              <div class="action-buttons">
                <a class="action" href="https://www.google.com/maps/dir//Szilv%C3%A1sv%C3%A1rad,+Szalajka+Fogad%C3%B3+%C3%A9s+%C3%89tterem,+Egri+%C3%BAt+2,+3348/@48.1032721,20.3185094,12z/data=!4m13!4m12!1m0!1m5!1m1!1s0x47408134954f8e97:0xcddfc4b9b705560a!2m2!1d20.3885497!2d48.1031787!2m3!6e1!7e2!8j1680357600!3e0" target='_blank'>Útvonal autóval</a>
                <a class="action" href="https://menetrend.hu" target='_blank'>Útvonal busszal</a>
              </div>
            """

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
