import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Documenting extends StatelessWidget {
  const Documenting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => GoRouter.of(context).pop(), // TODO: go back to drive
        ),
        title: const Text(
          "Manuelle Dokumentation",
        ),
      ),
      body: const Center(
        child: Text("Manuelle Dokumentation"),
      ),
    );
  }
}
