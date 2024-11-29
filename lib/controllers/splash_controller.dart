import 'package:get/get.dart';
import 'package:rebuyy/controllers/register_controller.dart';
import 'package:rebuyy/view/home_view.dart';
import 'package:rebuyy/view/register_view.dart';

class SplashController extends GetxController {
  final RegisterController authController = Get.find<RegisterController>();

  @override
  void onInit() {
    super.onInit();
    _navigateAfterSplash();
  }

  Future<void> _navigateAfterSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    if (authController.isLogin) {
      Get.to(() => HomeView());
    } else {
      Get.to(() => RegisterView());
    }
  }
}
