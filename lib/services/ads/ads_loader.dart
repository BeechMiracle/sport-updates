

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sport_updates/services/ads/ads_helper.dart';


class AdsLoader {
// loader for medium size banner ads
  void loadMediumBannerAd(void Function(Ad)? onLoad) {
    BannerAd(
      adUnitId: AdsHelper.bannerAdUnitId,
      size: AdSize.mediumRectangle,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: onLoad,
        onAdFailedToLoad: (ad, e) {
          ad.dispose();
          print(e.code);
        },
      ),
    ).load();
  }

  // loader for normal size banner ads
  void loadBannerAd(void Function(Ad)? onLoad) {
    BannerAd(
      adUnitId: AdsHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: onLoad,
        onAdFailedToLoad: (ad, e) {
          ad.dispose();
          print(e.code);
        },
      ),
    ).load();
  }


// loader for interstitial ads
  void loadInterstitialAd(void Function(InterstitialAd) onLoad) {
    InterstitialAd.load(
      adUnitId: AdsHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onLoad,
        onAdFailedToLoad: (e) {
          print(e.code);
        },
      ),
    );
  }
}
