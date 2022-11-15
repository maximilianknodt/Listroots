import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Recording extends StatelessWidget {
  const Recording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => GoRouter.of(context).pop(), // TODO: go back to drive
        ),
        title: const Text("kontinuierliche Aufzeichnung"),
      ),
      body: const Center(
        child: Text("kontinuierliche Aufzeichnung"),
      ),
    );
  }
}
