import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sport_updates/utils/animation.dart';
import 'package:sport_updates/models/news_model.dart';
import 'package:sport_updates/pages/news_detail_page.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsData});

  final NewsData newsData;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageTransition(
              page: NewsDetailScreen(newsData: newsData),
              isReversed: true,
              transition: SharedAxisTransitionType.horizontal,
            ),
          ),
        );
      },
      child: Card(
        color: theme.colorScheme.primary,
        margin: const EdgeInsets.only(
          top: 16,
          bottom: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(newsData.imageUrl),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Text(
                newsData.title,
                style: theme.textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
