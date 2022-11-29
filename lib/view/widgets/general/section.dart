import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.child,
    required this.title,
    this.leading,
    this.trailing,
    this.onTap,
  }) : assert(
          (trailing != null && onTap == null) ||
              (trailing == null && onTap != null) ||
              (trailing == null && onTap == null),
        );

  final Widget child;
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Row(
              children: [
                if (leading != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: leading!,
                  ),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (trailing != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: trailing!,
                  ),
                if (onTap != null) const Icon(Icons.chevron_right),
              ],
            ),
          ),
          child,
          SizedBox(height: 5),
        ],
      ),
      onTap: onTap,
    );
  }
}
