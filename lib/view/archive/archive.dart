import 'package:flutter/material.dart';
import 'package:listroots/data/database/database_main.dart';

class Archive extends StatelessWidget {
  Archive({super.key});

  var supabase = Supabase_Manager();
  int id = 5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Archive"),
    );
    /* Column(children: [
      TextButton(
          onPressed: () {
            supabase.writeData(id++, '05.12.22', 54.3, 10.1);
          },
          child: Text("Supabase  write")),
      TextButton(
          onPressed: () {
            supabase.readData();
          },
          child: Text("Supabase test read")),
    ]); */
  }
}
