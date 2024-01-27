import 'package:flutter/material.dart';
import 'package:socialmedia/controller/auth_controller/login_controller.dart';
import 'package:socialmedia/utils/indexes.dart';
class Profile extends StatelessWidget {
var controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: IconButton(onPressed: () {
        controller.signOut();

      }, icon: Icon(Icons.logout_outlined),),

    );
  }
}
