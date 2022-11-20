import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      child: Container(
        child: ListTile(
          leading: Icon(Icons.abc),
          title: Text("ja moin"),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
      onTap: () {
        print("funktionier doch bitte");
      },
    ));
  }
}
