import 'package:flutter/services.dart';

class Utils {
  const Utils._();

  static void hideStatusBar() => SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive,
        overlays: [SystemUiOverlay.top],
      );
}
