import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/navigation/navigation_bloc_bloc.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            if (state is BottomNavigationState) {
              return Text(state.currentDestination.label);
            } else {
              return const Text("Listroots");
            }
          },
        ),
      ),
      body: child,
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (value) => context
                .read<NavigationBloc>()
                .add(BottomNavEvent(context, value)),
            currentIndex: state is BottomNavigationState ? state.index : 0,
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
