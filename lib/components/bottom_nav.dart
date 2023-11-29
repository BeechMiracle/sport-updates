import 'package:flutter/material.dart';
import 'package:sport_updates/style/color.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key, required this.index, required this.onSelected});

  final int index;
  final Function(int?) onSelected;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return NavigationBar(
      onDestinationSelected: onSelected,
      selectedIndex: index,
      backgroundColor: kTransparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: <NavigationDestination>[
        // Tips navigation icon
        NavigationDestination(
          selectedIcon: Icon(
            Icons.tips_and_updates_outlined,
            size: 28,
            color: theme.colorScheme.outline,
          ),
          icon: Icon(
            Icons.tips_and_updates_outlined,
            size: 24,
            color: theme.colorScheme.outline,
          ),
          label: 'Tips',
        ),

        // News navigation icon
        NavigationDestination(
          selectedIcon: Icon(
            Icons.newspaper_outlined,
            size: 28,
            color: theme.colorScheme.outline,
          ),
          icon: Icon(
            Icons.newspaper_outlined,
            size: 24,
            color: theme.colorScheme.outline,
          ),
          label: 'News',
        ),
      ],
    );
  }
}
