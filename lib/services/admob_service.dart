// ============================================================================
// ADMOB SERVICE - Manages Google AdMob ads
// ============================================================================
// Handles:
// 1. Banner ads - shown at top/bottom
// 2. Interstitial ads - full screen ads (after harvesting)
// 3. Rewarded ads - show ad for reward
//
// ⚠️ IMPORTANT: Replace Ad Unit IDs with YOUR OWN from admob.google.com
// ============================================================================

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';

class AdMobService extends GetxController {
  // ========================================================================
  // ⚠️ REPLACE THESE WITH YOUR ACTUAL IDS FROM ADMOB
  // ========================================================================
  
  // Your AdMob App ID (get from admob.google.com)
  static const String ADMOB_APP_ID = 'ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy';
  
  // Test IDs - use these during development
  static const String BANNER_AD_UNIT_ID = 'ca-app-pub-3940256099942544/6300978111';
  static const String INTERSTITIAL_AD_UNIT_ID = 'ca-app-pub-3940256099942544/1033173712';
  static const String REWARDED_AD_UNIT_ID = 'ca-app-pub-3940256099942544/5224354917';

  // Ad objects
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;

  // Track if ads loaded
  var isBannerLoaded = false.obs;
  var isInterstitialLoaded = false.obs;

  // ========================================================================
  // INIT - Load ads when service starts
  // ========================================================================
  @override
  void onInit() {
    super.onInit();
    loadBannerAd();
    loadInterstitialAd();
  }

  // ========================================================================
  // CLEANUP - Dispose ads when app closes
  // ========================================================================
  @override
  void onClose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.onClose();
  }

  // ========================================================================
  // BANNER ADS - Small ads at top/bottom of screen
  // ========================================================================
  void loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: BANNER_AD_UNIT_ID,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print('✅ Banner Ad Loaded');
          isBannerLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          print('❌ Banner Ad Error: $error');
          ad.dispose();
        },
      ),
    );

    _bannerAd?.load();
  }

  // Get banner ad widget
  BannerAd? get bannerAd => isBannerLoaded.value ? _bannerAd : null;

  // ========================================================================
  // INTERSTITIAL ADS - Full screen ads (show after harvesting)
  // ========================================================================
  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: INTERSTITIAL_AD_UNIT_ID,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          print('✅ Interstitial Ad Loaded');
          _interstitialAd = ad;
          isInterstitialLoaded.value = true;
        },
        onAdFailedToLoad: (error) {
          print('❌ Interstitial Ad Error: $error');
        },
      ),
    );
  }

  /// Show interstitial ad
  void showInterstitialAd() {
    if (isInterstitialLoaded.value && _interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          print('Ad closed');
          ad.dispose();
          loadInterstitialAd(); // Load next ad
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          print('Ad error: $error');
          ad.dispose();
        },
      );

      _interstitialAd!.show();
    }
  }
}
