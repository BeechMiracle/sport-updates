import 'dart:async';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sport_updates/components/bottom_nav.dart';
import 'package:sport_updates/components/glass_box.dart';
import 'package:sport_updates/pages/news_page.dart';
import 'package:sport_updates/pages/sport_page.dart';
import 'package:sport_updates/services/ads/ads_loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  InterstitialAd? _interstitialAd;
  BannerAd? _ad;

  @override
  void initState() {
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

    AdsLoader().loadBannerAd(
      (ad) => setState(() {
        _ad = ad as BannerAd;
      }),
    );
    super.initState();
  }

  @override
  void dispose() {
    _ad?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          PageTransitionSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (
              Widget child,
              Animation<double> primaryAnimation,
              Animation<double> secondaryAnimation,
            ) {
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                fillColor: theme.colorScheme.background,
                child: child,
              );
            },
            child: <Widget>[
              const SportScreen(),
              const NewsScreen(),
            ][_currentPageIndex],
          ),
          if (_ad != null)
            Positioned(
              top: MediaQuery.of(context).size.height - 184,
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: double.infinity,
                height: _ad!.size.height.toDouble(),
                child: AdWidget(ad: _ad!),
              ),
            )
        ],
      ),
      bottomNavigationBar: GlassBox(
        child: BottomNavBar(
          index: _currentPageIndex,
          onSelected: _pageSwitcher,
        ),
      ),
    );
  }

  void _pageSwitcher(int? index) {
    setState(() {
      _currentPageIndex = index!;
      Future.delayed(const Duration(seconds: 5));
      _interstitialAd?.show();
    });
  }
}
