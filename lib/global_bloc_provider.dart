import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/navigation/navigation_bloc_bloc.dart';

/// The top most location for [BlocProvider]s.
///
/// Create Bloc instances here to pass them down to the widgets
/// that need them to be available in the entire widget tree.
class GlobalBlocProvider extends StatelessWidget {
  const GlobalBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
      ],
      child: child,
    );
  }
}
