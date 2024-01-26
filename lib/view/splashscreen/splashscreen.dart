import 'package:socialmedia/utils/indexes.dart';

import '../../components/app_colors.dart';
import '../../controller/splashscreen_controller/splashscreen_controller.dart';






class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhiteColor,
      body: SafeArea(
        child: GetBuilder<SplashScreenController>(
          init: SplashScreenController(),
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ScaleTransition(
                    scale: context.scale,
                    child: Image.asset(
                      "assets/pngs/Facebook_logo.png",
                      width: Get.width * .15,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
