import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:socialmedia/utils/indexes.dart';

import '../../view/auth/auth_gate.dart';
import '../../view/auth/login.dart';






class SplashScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController scaleController;
  late AnimationController scaleController2;
  late Animation<double> scale;
  late Animation<double> scale2;

  @override
  void onInit() {
    navigate();
    super.onInit();
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    scaleController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    scale = Tween<double>(begin: 1, end: 1.1).animate(scaleController);
    scale2 = Tween<double>(begin: .8, end: 1).animate(scaleController2);
    scaleController.repeat(reverse: false);
    super.onInit();
  }

  navigate() async {
    // var token = LocalStorage.getToken();
    Future.delayed(
      const Duration(seconds: 5),
         () => Get.offAll(() =>  Login()),

    );

  }


}