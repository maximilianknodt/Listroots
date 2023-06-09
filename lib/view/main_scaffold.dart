import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/navigation/navigation_bloc_bloc.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    super.key,
    required this.child,
    this.action,
    this.title,
  });

  final Widget child;
  final Widget? action;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title ?? const Text("Listroots"),
        actions: action != null ? [action!] : [],
      ),
      body: child,
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
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
