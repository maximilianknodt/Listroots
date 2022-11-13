import 'package:flutter/material.dart';

class OverlayedMessageBanner extends StatelessWidget {
  const OverlayedMessageBanner({
    Key? key,
    required this.leading,
    required this.child,
    this.onPressed,
    this.isStationary = false,
  }) : super(key: key);

  final Widget leading;
  final Widget child;
  final Function()? onPressed;
  final bool isStationary;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: !isStationary
          ? Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    background: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.6),
                  ),
            )
          : _stationaryTheme(Theme.of(context)),
      child: _OverlayedMessageBannerContainer(
        leading: leading,
        onPressed: onPressed,
        child: child,
      ),
    );
  }

  ThemeData _stationaryTheme(ThemeData origial) {
    return origial.copyWith(
      brightness: Brightness.dark,
      colorScheme: origial.colorScheme.copyWith(
        background: origial.colorScheme.tertiary,
        onBackground: origial.colorScheme.onTertiary,
      ),
      textTheme: origial.textTheme.copyWith(
        bodyMedium: origial.textTheme.bodyMedium?.copyWith(
          color: origial.colorScheme.onTertiary,
        ),
      ),
      iconTheme: IconThemeData(
        color: origial.colorScheme.onTertiary,
      ),
    );
  }
}

class _OverlayedMessageBannerContainer extends StatelessWidget {
  const _OverlayedMessageBannerContainer({
    Key? key,
    required this.leading,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  final Widget leading;
  final Widget child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10), // TODO: theme extension
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10), // TODO: theme extension
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10), // TODO: theme extension
          child: Padding(
            padding: const EdgeInsets.all(10), // TODO: theme extension
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 40, child: leading),
                const SizedBox(width: 8), // TODO: theme extension
                Expanded(child: child),
                if (onPressed != null) const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
