import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:sport_updates/components/app_bar.dart';
import 'package:sport_updates/components/news_card.dart';
import 'package:sport_updates/models/news_model.dart';
import 'package:sport_updates/services/ads/ads_loader.dart';
import 'package:sport_updates/services/network_data/services.dart';
import 'package:sport_updates/shimmers/shim_gradient.dart';
import 'package:sport_updates/shimmers/shimmer.dart';
import 'package:sport_updates/shimmers/widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  static const _adIndex = 4;
  BannerAd? _ad;

  late final Future<List<NewsData>> newsData;

  @override
  void initState() {
    newsData = NewsService.data().getNewsData(http.Client());
    AdsLoader().loadMediumBannerAd(
      (ad) => setState(() {
        _ad = ad as BannerAd;
      }),
    );
    super.initState();
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(
        context: context,
        title: 'News',
        onpressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: newsData,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Shimmer(
                      gradient: shimmerGradient,
                      child: shimmerContainerList(context: context),
                    );
                  }
                  if (snapshot.hasData) {
                    List<NewsData> newsinfo = snapshot.data!.toList();
                    return ListView.builder(
                      itemCount: newsinfo.length,
                      itemBuilder: (context, index) {
                        if (_ad != null && index == _adIndex) {
                          return Container(
                            width: _ad!.size.width.toDouble(),
                            height: _ad!.size.height.toDouble(),
                            alignment: Alignment.center,
                            child: AdWidget(ad: _ad!),
                          );
                        } else {
                          return NewsCard(
                              newsData: newsinfo[_getListIndex(index)]);
                        }
                      },
                    );
                  }
                  return Center(
                    child: Text(
                      'Article is not available',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getListIndex(int i) {
    if (i >= _adIndex && _ad != null) {
      return i - 1;
    }
    return i;
  }
}
