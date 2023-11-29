import 'package:flutter/material.dart';
import 'package:sport_updates/shimmers/loading.dart';

Widget shimmerContainer({required BuildContext context}) {
  return ShimmerLoading(
    child: AspectRatio(
      aspectRatio: 16 / 9,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        margin: const EdgeInsets.only(top: 16, bottom: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );
}

Widget shimmerContainerList({required BuildContext context}) {
  return ListView(
    children: [
      shimmerContainer(context: context),
      shimmerContainer(context: context),
      shimmerContainer(context: context),
      shimmerContainer(context: context),
    ],
  );
}
