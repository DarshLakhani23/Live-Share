import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_share/modules/home/controller/home_controller.dart';
import 'package:live_share/utils/app_colors.dart';
import 'package:live_share/utils/app_config.dart';
import 'package:live_share/utils/size_utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveScreenView extends StatefulWidget {
  final String liveID, userID;
  final bool isHost;

  LiveScreenView({
    super.key,
    required this.liveID,
    this.isHost = false,
    required this.userID,
  });

  @override
  State<LiveScreenView> createState() => _LiveScreenViewState();
}

class _LiveScreenViewState extends State<LiveScreenView> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ZegoUIKitPrebuiltLiveStreaming(
              appID: appID,
              appSign: appSign,
              userID: widget.userID,
              userName: widget.userID,
              liveID: widget.liveID,
              config: widget.isHost
                  ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
                  : ZegoUIKitPrebuiltLiveStreamingConfig.audience()
                ..audioVideoViewConfig.showAvatarInAudioMode = true
                ..audioVideoViewConfig.showSoundWavesInAudioMode = true),
          Positioned(
            top: SizeUtils.horizontalBlockSize * 7.5,
            left: SizeUtils.horizontalBlockSize * 45,
            child:  GestureDetector(
                    onTap: () async {
                      await homeController.createDynamicLink(
                        false,
                        "live?id=${homeController.liveIDController.text}",
                      );
                      await Share.share(homeController.linkMessage.value);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.black.withOpacity(0.28),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.share,
                          size: 20,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
          ),
        ],
      ),
    );
  }

}
