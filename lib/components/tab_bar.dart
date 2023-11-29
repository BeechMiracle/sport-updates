import 'package:flutter/material.dart';
import 'package:sport_updates/style/color.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.controller,
    required this.tabs,
  });

  final TabController controller;
  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TabBar(
      controller: controller,
      labelColor: theme.colorScheme.outline,
      labelStyle: theme.textTheme.displaySmall!.copyWith(
        fontWeight: FontWeight.w600,
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      unselectedLabelStyle: theme.textTheme.displaySmall,
      indicatorColor: kMainButton,
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
      physics: const BouncingScrollPhysics(),
      tabs: tabs,
    );
  }
}
