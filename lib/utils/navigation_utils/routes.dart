import 'package:live_share/modules/home/presentation/home_screen.dart';
import 'package:live_share/modules/live/presentation/live_screen.dart';
import 'package:live_share/modules/splash/presentation/splash_screen.dart';

import 'package:get/get.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  static const String splash = '/splash';
  static const String home = '/home';
  static const String liveScreenView = '/liveScreenView';

  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: splash,
      page: () => const SplashScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: home,
      page: () => HomeScreen(),
      transition: defaultTransition,
    ),
  ];
}
