import 'package:flutter/material.dart';

import '../widgets/general/section.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Section(
            title: "kontinuierliche Aufzeichnungen",
            leading: Icon(Icons.videocam_outlined),
            trailing: IconButton(
              icon: Icon(Icons.upload_outlined),
              onPressed: () {},
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // TODO: diese austauschen @Thorben
                ListTile(
                  title: Text("Aufzeichnung 1"),
                  subtitle: Text("12.12.2020"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Aufzeichnung 1"),
                  subtitle: Text("12.12.2020"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Aufzeichnung 1"),
                  subtitle: Text("12.12.2020"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Section(
            title: "manuelle Dokumentationen",
            leading: Icon(Icons.linked_camera_outlined),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // TODO: diese austauschen @Thorben
                ListTile(
                  title: Text("Aufzeichnung 1"),
                  subtitle: Text("12.12.2020"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Aufzeichnung 1"),
                  subtitle: Text("12.12.2020"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Aufzeichnung 1"),
                  subtitle: Text("12.12.2020"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
