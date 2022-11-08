import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../logic/navigation/navigation_bloc_bloc.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Roots'),
      ),
      body: child,
      // bottomSheet: BottomSheet(
      //   onClosing: () {},
      //   builder: (context) {
      //     return Container(
      //       height: 100,
      //       color: Colors.red,
      //     );
      //   },
      // ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (value) {
              log('BottomNavigationBar.onTap: $value');
              context.go(state.destinations[value].route);
            },
            items: state.destinations.map((e) {
              return BottomNavigationBarItem(
                icon: Icon(e.icon),
                label: e.label,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
