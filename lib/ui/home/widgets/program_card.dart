import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:wedding_page/domain/model/program_point.dart';
import 'package:wedding_page/ui/widgets/common_text.dart';
import 'package:wedding_page/ui/widgets/section_title.dart';
import 'package:wedding_page/ui/widgets/wedding_divider.dart';

class ProgramCard extends StatelessWidget {
  final _programPoints = [
    ProgramPoint(name: "Vendégvárás", time: DateTime.parse('2023-04-01 14:30:00Z')),
    ProgramPoint(name: "Szertartás", time: DateTime.parse('2023-04-01 16:00:00Z')),
    ProgramPoint(name: "Ünnepi vacsora", time: DateTime.parse('2023-04-01 17:30:00Z')),
    const ProgramPoint(name: "További meglepetések"),
  ];

  final ScrollController scrollController;

  ProgramCard({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SectionTitle("Programok"),
          ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: _programPoints.length,
            itemBuilder: (ctx, index) {
              return ProgramListItem(_programPoints[index]);
            },
          ),
          WeddingDivider(),
        ]
      )
    );
  }
}

class ProgramListItem extends StatelessWidget {
  final ProgramPoint programPoint;

  const ProgramListItem(this.programPoint, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CommonText(
                programPoint.time != null ? DateFormat.Hm().format(programPoint.time!) : "???",
                textAlign: TextAlign.right,
              ),
            )
          ),
          Expanded(
            child: CommonText(programPoint.name)
          ),
        ],
      ),
    );
  }
}
