import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_share/utils/app_colors.dart';
import 'package:live_share/utils/navigation_utils/routes.dart';
import 'package:live_share/utils/size_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    openScreen();
    super.initState();
  }

  void openScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    Get.offAndToNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            "Live Share App".toUpperCase(),
            style: GoogleFonts.pacifico(
              textStyle: Theme.of(context).textTheme.titleMedium,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }
}
