import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:wedding_page/domain/model/carousel_image.dart';
import 'package:wedding_page/ui/theme/breakpoints.dart';
import 'package:wedding_page/ui/widgets/section_title.dart';
import 'package:wedding_page/ui/widgets/wedding_divider.dart';

class WelcomeCard extends StatelessWidget {
  final _carouselImages = const [
    CarouselImage(file: "316431958_870582264296345_5200344052286663399_n.jpg"),
    CarouselImage(file: "IMG_20200717_181119.jpg"),
    CarouselImage(file: "IMG_20210817_144325.jpg"),
    CarouselImage(file: "IMG_20220522_153952.jpg"),
    CarouselImage(file: "IMG_20220613_112218630.jpg"),
    CarouselImage(file: "IMG_20220615_211549079.jpg"),
    CarouselImage(file: "IMG_20221218_132541487.jpg"),
    CarouselImage(file: "IMG_20230202_181914.jpg"),
    CarouselImage(file: "IMG_20230202_093420442.jpg"),
    CarouselImage(file: "IMG_20230203_165359.jpg"),
  ];

  const WelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SectionTitle("Meghívó"),
            // invitation text
            const Text("Szeretettel meghívunk a 2023. Április 1-jén tartandó esküvőnkre!"),
            const SizedBox(height: 16.0),
            CarouselSlider(
              items: _carouselImages.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: width,
                        child: Image(
                          fit: width > WeddingBreakpoints.mobileView ? BoxFit.cover : null,
                          image: AssetImage("images/carousel/${i.file}"),
                        ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 400,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 7),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.4,
                initialPage: 3,
                viewportFraction: 0.6,
              ),
            ),
            const WeddingDivider(),
          ],
        ),
      ),
    );
  }
}
