import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialmedia/utils/indexes.dart';
import 'package:socialmedia/view/auth/login.dart';

import '../../components/app_colors.dart';
import '../../components/snack_bars.dart';
import '../../view/dashboard/home.dart';




class SignupController extends GetxController{

  // var authServices = Get.put(AuthService());


  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();

  final passwordController = TextEditingController();


  var fullNameError = "".obs;
  var emailError = "".obs;
  var phoneError = "".obs;
  var genderError = "".obs;

  var passwordError = "".obs;
  var transactionPinError = "".obs;

  var isLoading = false.obs;
  var active = appInactiveColor.obs;
  var activeOTP = appInactiveColor.obs;
  var activeNewPassword = appInactiveColor.obs;
  var activeTransactionPin = appInactiveColor.obs;



  clearFullNameError(val) {
    enableButtonColor();
    return fullNameError.value = "";
  }
  clearEmailError(val) {
    enableButtonColor();
    return emailError.value = "";
  }

  clearPasswordError(val) {
    enableButtonColor();
    return passwordError.value = "";
  }




  signUp() async {
    isLoading.value = true;
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      AppSnackBars.successSnackBar(message: "User created successfully");
      Get.offAll(() =>   Login());
    } on FirebaseAuthException  catch (e) {
      isLoading.value = false;
      if(e.code == 'weak-password'){
        AppSnackBars.errorSnackBar(message: e.toString());
      }
      else if(e.code == 'email-already-in-use'){
        AppSnackBars.errorSnackBar(message: e.toString());
      }
    }
  }


  enableButtonColor(){

    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
      active.value = appPrimaryTwoColor;
    }
    else{
      active.value = appInactiveColor;
    }
  }



  validateSignUp(BuildContext context) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!GetUtils.isEmail(emailController.text.trim())) {
      emailError.value = "Please enter a valid email address";
    } else  if (passwordController.text.isEmpty) {
      passwordError.value ='Please enter password';
    } else if (!regex.hasMatch(passwordController.text.trim())) {
      passwordError.value=  'Provide password with numbers, letters and special characters e.g. Fa123)(*';


    } else {
      signUp();
      //BottomTab()


    }
  }









var trasnPin = ''.obs;
  var transPinButtontext = ''.obs;
  int index = 0;
  enableTransactionPinColor(){
    print(index.toString() + "length");
    if(index ==4){
      activeTransactionPin.value = appPrimaryTwoColor;
      index =0;
      print(index.toString() + "skg");



    }
    else{
      activeTransactionPin.value = appInactiveColor;
    }
  }


}