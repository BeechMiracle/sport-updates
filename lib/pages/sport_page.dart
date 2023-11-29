import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sport_updates/components/app_bar.dart';
import 'package:sport_updates/components/tab_bar.dart';
import 'package:sport_updates/services/ads/ads_loader.dart';
import 'package:sport_updates/tabviews/all_sport.dart';
import 'package:sport_updates/tabviews/basketball.dart';
import 'package:sport_updates/tabviews/football.dart';
import 'package:sport_updates/tabviews/hockey.dart';
import 'package:sport_updates/tabviews/sport_tab.dart';
import 'package:sport_updates/tabviews/tennis.dart';

class SportScreen extends StatefulWidget {
  const SportScreen({super.key});

  @override
  State<SportScreen> createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  BannerAd? _ad;

  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this,
    );

    AdsLoader().loadMediumBannerAd(
      (ad) => setState(() {
        _ad = ad as BannerAd;
      }),
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(
        context: context,
        title: 'Tips',
        onpressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),

            // tips tabviews
            CustomTabBar(
              controller: _tabController,
              tabs: SportTab().tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  AllSportTabView(
                    bannerAd: _ad,
                  ),
                  FootballTabView(
                    bannerAd: _ad,
                  ),
                  BasketballTabView(
                    bannerAd: _ad,
                  ),
                  HockeyTabView(
                    bannerAd: _ad,
                  ),
                  TennisTabView(
                    bannerAd: _ad,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
