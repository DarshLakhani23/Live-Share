import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_share/modules/live/presentation/live_screen.dart';
import 'package:live_share/utils/app_config.dart';
import 'package:live_share/utils/string_utils.dart';

class HomeController extends GetxController {
  TextEditingController liveIDController = TextEditingController();
  final userInKey = GlobalKey<FormState>();

  RxBool isCreatingLink = false.obs;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  RxString linkMessage = "".obs;

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      final Uri uri = dynamicLinkData.link;
      final queryParams = uri.queryParameters;
      if (queryParams.isNotEmpty) {
        String? liveID = queryParams["id"];
        Get.to(
          LiveScreenView(
            liveID: liveID ?? "",
            isHost: false,
            userID: userId,
          ),
        );
      } else {
        MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                AppString.pageNot,
              ),
            ),
          );
        });
      }
    }).onError((error) {});
  }

  Future<void> createDynamicLink(bool short, String link) async {
    isCreatingLink.value = true;

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: kUriPrefix,
      link: Uri.parse(kUriPrefix + link),
      androidParameters: const AndroidParameters(
        packageName: 'com.example.live_share',
        minimumVersion: 0,
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }

    linkMessage.value = url.toString();
    isCreatingLink.value = false;
  }
}
