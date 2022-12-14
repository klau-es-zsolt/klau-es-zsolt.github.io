import 'package:flutter/material.dart';
import 'package:wedding_page/ui/widgets/section_title.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: const [
          SectionTitle("Menü"),
        ],
      ),
    );
  }
}
