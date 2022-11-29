import 'package:flutter/material.dart';

import 'background_blob.dart';

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
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor(context),
          borderRadius: BorderRadius.circular(10),
          border: borderColor(context) != null
              ? Border.all(color: borderColor(context)!)
              : null,
          boxShadow: [
            BoxShadow(
              color: backgroundColor(context).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            BackgroundBlob(size: 300, left: -120, top: -170, id: '9-4-87392'),
            BackgroundBlob(size: 300, right: -140, top: -200, smooth: 1.0),
            BackgroundBlob(size: 500, right: -240, bottom: -350),
            Padding(
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
