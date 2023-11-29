import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sport_updates/components/sport_card.dart';
import 'package:sport_updates/models/sport_model.dart';
import 'package:sport_updates/services/sports.dart';
import 'package:sport_updates/style/color.dart';

class AllSportTabView extends StatelessWidget {
  const AllSportTabView({
    super.key,
    this.bannerAd,
  });

  final BannerAd? bannerAd;

  static const _adIndex = 4;

  @override
  Widget build(BuildContext context) {
    final List<SportData> allSports = Sport().allSport;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      width: double.infinity,
      color: kTransparent,
      child: ListView.builder(
        itemCount: allSports.length + (bannerAd != null ? 1 : 0),
        itemBuilder: (context, index) {
          if (bannerAd != null && index == _adIndex) {
            return Container(
              width: bannerAd!.size.width.toDouble(),
              height: bannerAd!.size.height.toDouble(),
              alignment: Alignment.center,
              child: AdWidget(ad: bannerAd!),
            );
          } else {
            return SportCard(tipsData: allSports[_getListIndex(index)]);
          }
        },
      ),
    );
  }

  int _getListIndex(int i) {
    if (i >= _adIndex && bannerAd != null) {
      return i - 1;
    }
    return i;
  }
}
