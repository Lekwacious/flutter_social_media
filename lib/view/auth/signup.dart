import 'package:socialmedia/utils/indexes.dart';

import '../../components/app_colors.dart';
import '../../components/auth_input_form.dart';
import '../../components/custom_button.dart';
import '../../components/scrow_behaviour.dart';
import '../../controller/auth_controller/signup_controller.dart';

class Signup extends StatelessWidget {
  final controller = Get.put(SignupController());

  Signup({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ScrollConfiguration(
              behavior: RemoveScrollBubbleBehavior(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Obx(
                  () => ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 44,
                      ),
                      Image.asset(
                        "assets/pngs/Facebook_logo.png",
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      FormTextField(
                        image: "assets/pngs/mail.png",
                        errortxt: controller.emailError.value.isEmpty
                            ? null
                            : controller.emailError.value,
                        textCapitalization: TextCapitalization.none,
                        hintText: 'Email',
                        textInputAction: TextInputAction.next,
                        onChange: controller.clearEmailError,
                        textInputType: TextInputType.text,
                        controller: controller.emailController,
                        validator: (String) {},
                      ),

                      FormTextField(
                        image: "assets/pngs/password.png",
                        errortxt: controller.passwordError.value.isEmpty
                            ? null
                            : controller.passwordError.value,
                        textInputAction: TextInputAction.done,
                        hintText: 'Password',
                        onChange: controller.clearPasswordError,
                        // onChangeForColor: controller.enableButtonColor(),

                        textInputType: TextInputType.visiblePassword,
                        isPassWordField: true,
                        controller: controller.passwordController,
                        validator: (String) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      const SizedBox(
                        height: 120,
                      ),
                      CustomButton(
                        text: 'Signup',
                        isLoading: controller.isLoading.value,
                        onTap:
                            controller.active.value == appInactiveColor
                                ? () {}
                                : () {
                                    controller.validateSignUp(context);
                                  },
                        color: controller.active.value,
                        textColor: Colors.white,
                        loadingColor: Colors.white,
                      ),

                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
