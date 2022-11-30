import 'package:flutter/material.dart';
import 'package:listroots/view/archive/archive_listelement.dart';

import '../widgets/general/section.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ArchiveListelement(
                date: "22.10.22 13:37 Uhr",
                value: "0:37h, 3 Detektionen",
              ),
              SizedBox(height: 5),
              ArchiveListelement(
                date: "23.10.22 14:37 Uhr",
                value: "1:15h, 2 Detektionen",
              ),
              SizedBox(height: 5),
              ArchiveListelement(
                date: "23.10.22 18:00 Uhr",
                value: "0:20h, 3 Detektionen",
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ArchiveListelement(
                date: "22.10.22 13:37 Uhr",
                value: "80% Konfidenz",
              ),
              SizedBox(height: 5),
              ArchiveListelement(
                date: "22.10.22 13:37 Uhr",
                value: "70% Konfidenz",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
