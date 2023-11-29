import 'package:flutter/material.dart';
import 'package:sport_updates/models/sport_model.dart';

class SportCard extends StatelessWidget {
  const SportCard({super.key, required this.tipsData});

  final SportData tipsData;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      color: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${tipsData.country} - ${tipsData.league}',
                      style: theme.textTheme.displaySmall,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: theme.colorScheme.secondary,
                              child: Image.asset(
                                tipsData.homeImageUrl,
                                height: 48,
                                width: 48,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              tipsData.homeTeam,
                              style: theme.textTheme.displaySmall,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'VS',
                          style: theme.textTheme.displayMedium,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: theme.colorScheme.secondary,
                              child: Image.asset(
                                tipsData.awayImageUrl,
                                height: 48,
                                width: 48,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              tipsData.awayTeam,
                              style: theme.textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Prediction',
                      style: theme.textTheme.displaySmall,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      tipsData.prediction,
                      style: theme.textTheme.displaySmall,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      height: 16,
                      width: 80,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          tipsData.dateTime,
                          style: theme.textTheme.displaySmall?.copyWith(
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
