import 'package:live_share/deeplinking/route_services.dart';
import 'package:live_share/utils/size_utils.dart';
import 'package:live_share/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'utils/app_binding.dart';
import 'utils/navigation_utils/routes.dart';
import 'widgets/my_behavior.dart';

class LiveShareApp extends StatelessWidget {
  const LiveShareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteServices.generateRoute,
      initialRoute: Routes.splash,
      title: AppString.appName,
      getPages: Routes.pages,
      initialBinding: AppBidding(),
      builder: (context, child) {
        SizeUtils().init(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          ),
        );
      },
    );
  }
}
