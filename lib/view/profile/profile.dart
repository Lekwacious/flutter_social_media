import 'package:flutter/material.dart';
import 'package:socialmedia/controller/auth_controller/login_controller.dart';
import 'package:socialmedia/utils/indexes.dart';
class Profile extends StatelessWidget {
var controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Container(

          color: Colors.white,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Log out"),
                IconButton(onPressed: () {
                  controller.signOut();

                }, icon: Icon(Icons.logout_outlined),),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
