import 'package:flutter/material.dart';

abstract class RecordButtonBase extends StatelessWidget {
  const RecordButtonBase({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(context),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor(context),
          borderRadius: BorderRadius.circular(10),
          border: borderColor(context) != null
              ? Border.all(color: borderColor(context)!)
              : null,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: foregroundColor(context),
              size: 30,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: foregroundColor(context),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Color backgroundColor(BuildContext context);

  Color foregroundColor(BuildContext context);

  Color? borderColor(BuildContext context) => null;

  void onPressed(BuildContext context);
}
