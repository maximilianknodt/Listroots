import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listroots/main.dart';

import '../../logic/auth/auth_bloc.dart';

class ProfileIconButton extends StatelessWidget {
  const ProfileIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return InkWell(
          onTap: _onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Center(
              child: state is Authenticated
                  ? Text(
                      state.user.initials,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    )
                  : const Icon(Icons.error_outline),
            ),
          ),
        );
      },
    );
  }

  void _onTap() async {
    log("tap", name: "ProfileIconButton");
    var client = await createClient();
  }
}
