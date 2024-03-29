import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialmedia/utils/indexes.dart';
import 'package:socialmedia/view/auth/login.dart';

import '../../components/app_colors.dart';
import '../../components/snack_bars.dart';
import '../../view/dashboard/bottomtab.dart';




class LoginController extends GetxController{



  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var emailError = "".obs;
  var passwordError = "".obs;
  var isLoading = false.obs;
  var active = appInactiveColor.obs;

  clearEmailError(val) {
    enableButtonColor();
    return emailError.value = "";
  }

  clearPasswordError(val) {
    enableButtonColor();
    return passwordError.value = "";
  }

  loginUser( ) async {
    isLoading.value = true;
    try {
    await  FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
    AppSnackBars.successSnackBar(message: "User LoggedIn successfully");
    isLoading.value =false;
    Get.offAll(() =>     BottomTab());
    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        AppSnackBars.errorSnackBar(message: "No user found with that email");
        isLoading.value =false;
      }
      else if(e.code == 'wrong-password'){
        AppSnackBars.errorSnackBar(message: "wrong password for that user");
        isLoading.value =false;
      }
    }
    catch(e){
      print(e.toString());
    };
  }

  validateLogin(BuildContext context) {
    if (!GetUtils.isEmail(emailController.text.trim())) {
      emailError.value = "Please enter a valid email address";
    } else if (GetUtils.isLengthLessThan(passwordController.text.trim(), 8)) {
      passwordError.value = "Please enter a valid password";
    } else {
      loginUser();

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

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    AppSnackBars.successSnackBar(message: "User Logged out successfully");
    Get.offAll(()=> Login());
  }

}
