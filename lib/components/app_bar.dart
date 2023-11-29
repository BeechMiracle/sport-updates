import 'package:flutter/material.dart';

AppBar mainAppBar({
  required BuildContext context,
  required String title,
  required void Function()? onpressed,
}) {
  ThemeData theme = Theme.of(context);

  return AppBar(
    backgroundColor: theme.colorScheme.background,
    title: Text(
      title,
      style: theme.textTheme.displayLarge,
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: onpressed,
        splashRadius: 24,
        iconSize: 24,
        color: theme.colorScheme.outline,
        icon: const Icon(
          Icons.notifications_outlined,
        ),
      )
    ],
    elevation: 0,
    bottomOpacity: 0,
  );
}
