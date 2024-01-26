import 'package:socialmedia/utils/indexes.dart';

import '../components/app_colors.dart';


class DashboardController extends GetxController{
  var isLoading = false.obs;
  var active = appInactiveColor.obs;

  bool isShowing= true;

   var obscureText = '........'.obs;
   var amount = '78,254,800'.obs;
  void toggle() {

    if(isShowing== true){
      amount.value = obscureText.value;
      isShowing = false;
    }
    else{
      amount.value = '78,254,800';
      isShowing = true;
    }

  }





}