import 'package:socialmedia/utils/indexes.dart';

import '../../components/app_colors.dart';
import '../../components/scrow_behaviour.dart';
import '../../dashboard_controller/dashboard_contoller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(DashboardController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: Container(
          color: appSemiWhite,
          child: ScrollConfiguration(
              behavior: RemoveScrollBubbleBehavior(),
              child: Obx(() =>
                  ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [






                          ],
                        ),
                      ),



                  ),
              )),
        );


  }


  ///logout function here
  // buildLogoutModal(BuildContext context) {
  //   return showDialog(
  //       barrierDismissible: true,
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           alignment: Alignment.center,
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20)),
  //           backgroundColor: Colors.white,
  //           contentPadding: const EdgeInsets.symmetric(
  //             horizontal: 30, //50.w
  //             vertical: 30, //50.h
  //           ),
  //           content: SizedBox(
  //             width: 395,
  //             height: 440,
  //             child: Column(children: [
  //               Text(
  //                 "Add an account you can only use for withdrawal",
  //                 style: GoogleFonts.lato(
  //                   textStyle: const TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 25,
  //               ),
  //               Text(
  //                 "Keep going to find your ideal properties. Can we confirm witth a yes to continue?",
  //                 style: GoogleFonts.lato(
  //                   textStyle: const TextStyle(
  //                     color: Colors.grey,
  //                     fontSize: 15,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 40,
  //               ),
  //               CustomButton(
  //                 text: 'Proceed',
  //                 // isLoading: controller.isLoading.value,
  //                 onTap: controller.active.value == bitsChangeInactiveColor
  //                     ? () {}
  //                     : () {
  //                   // controller.validateZainPay(context);
  //                 },
  //                 color: controller.active.value,
  //                 textColor: Colors.white,
  //                 loadingColor: Colors.white,
  //               ),
  //             ]),
  //           ),
  //         );
  //       });
  // }
}
