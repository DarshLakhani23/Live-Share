import 'package:get/get.dart';
import 'package:live_share/modules/home/controller/home_controller.dart';

class AppBidding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
