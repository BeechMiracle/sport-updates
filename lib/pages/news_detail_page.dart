
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sport_updates/models/news_model.dart';
import 'package:sport_updates/services/ads/ads_loader.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, required this.newsData});

  final NewsData newsData;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  BannerAd? _bannerAd;
  BannerAd? _ad;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    AdsLoader().loadMediumBannerAd(
      (ad) => setState(() {
        _bannerAd = ad as BannerAd;
      }),
    );
    AdsLoader().loadBannerAd(
      (ad) => setState(() {
        _ad = ad as BannerAd;
      }),
    );
    AdsLoader().loadInterstitialAd((ad) {
      ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          setState(() {
            ad.dispose();
            _interstitialAd = null;
          });
        },
      );
      setState(() {
        _interstitialAd = ad;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _ad?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            _interstitialAd?.show();
          },
          icon: const Icon(Icons.arrow_back),
          color: theme.colorScheme.outline,
          iconSize: 24,
        ),
        backgroundColor: theme.colorScheme.background,
        elevation: 0,
        bottomOpacity: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.newsData.title,
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            AspectRatio(
              aspectRatio: 16/9,
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.newsData.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(widget.newsData.publishedAt,
                style: theme.textTheme.displaySmall),
                const SizedBox(
              height: 24,
            ),
            if (_ad != null)
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: _ad!.size.height.toDouble(),
                  child: AdWidget(ad: _ad!),
                ),
              ),
              const SizedBox(
              height: 24,
            ),
            Text(
              widget.newsData.body!,
              style: theme.textTheme.displaySmall,
            ),
            const SizedBox(
              height: 24,
            ),
            if (_bannerAd != null)
              Center(
                child: SizedBox(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
