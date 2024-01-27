import 'package:socialmedia/utils/indexes.dart';
import 'package:socialmedia/view/auth/signup.dart';

import '../../components/app_colors.dart';
import '../../components/auth_input_form.dart';
import '../../components/custom_button.dart';
import '../../components/scrow_behaviour.dart';
import '../../controller/auth_controller/login_controller.dart';

class Login extends StatelessWidget {
  final controller = Get.put(LoginController());

  Login({super.key});
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
                      GestureDetector(
                        onTap: () {
                          // Get.to(VerifyEmail());
                        },
                        child: Image.asset(
                          "assets/pngs/Facebook_logo.png",
                          height: 150,
                          width: 150,
                        ),
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
                        //hintText: 'keleDevine001',
                        textInputAction: TextInputAction.next,
                        onChange: controller.clearEmailError,
                        textInputType: TextInputType.text,
                        controller: controller.emailController,
                        validator: (String) {},
                      ),

                      // const SizedBox(
                      //   height: 10,
                      // ),
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

                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        InkWell(
                          onTap: () {
                            //Get.to(() => ForgotPasswordScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Urbanist',
                                ),
                              ),
                              const SizedBox(width: 2),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => Signup());
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: appPrimaryTwoColor,
                                    fontFamily: 'Urbanist',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 120,
                      ),

                      CustomButton(
                        text: 'Continue',
                        isLoading: controller.isLoading.value,
                        onTap: controller.active.value == appInactiveColor
                            ? () {}
                            : () {
                                controller.enableButtonColor();
                                controller.validateLogin(context);
                              },
                        color: controller.active.value,
                        textColor: Colors.white,
                        loadingColor: Colors.white,
                      ),

                      const SizedBox(
                        height: 95,
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
