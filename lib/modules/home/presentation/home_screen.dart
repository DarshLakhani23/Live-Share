import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_share/helper/validation_utils.dart';
import 'package:live_share/modules/home/controller/home_controller.dart';
import 'package:live_share/modules/live/presentation/live_screen.dart';
import 'package:live_share/utils/app_colors.dart';
import 'package:live_share/utils/app_config.dart';
import 'package:live_share/utils/size_utils.dart';
import 'package:live_share/utils/string_utils.dart';
import 'package:live_share/widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
    homeController.initDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 5,
          ),
          child: Form(
            key: homeController.userInKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: homeController.liveIDController,
                  validator: AppValidator.isUserNameValid,
                  decoration: InputDecoration(
                    labelText: AppString.joinLive,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeUtils.horizontalBlockSize * 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (homeController.userInKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiveScreenView(
                            liveID: homeController.liveIDController.text,
                            isHost: true,
                            userID: userId,
                          ),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.black,
                    ),
                  ),
                  child: AppText(
                    text: AppString.startLive,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
