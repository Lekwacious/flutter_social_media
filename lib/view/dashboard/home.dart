import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialmedia/utils/indexes.dart';

import '../../components/app_colors.dart';
import '../../components/auth_input_form.dart';
import '../../components/custom_button.dart';
import '../../components/scrow_behaviour.dart';
import '../../dashboard_controller/dashboard_contoller.dart';
import '../auth/signup.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(DashboardController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appWhiteColor,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: SvgPicture.asset(
          "assets/svgs/f.svg",
          width: Get.width * .15,
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome back! ",
              style: GoogleFonts.arima(
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {
                // Get.to(()=>FilterScreen());
              },
              child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: appBlue),
                  child: Icon(Icons.notifications_outlined))),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Obx(
              () => ListView(
                //shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person),
                      Expanded(
                        child: CustomButton2(
                          text: 'What\'s on your mind',
                          isLoading: controller.isLoading.value,
                          onTap: () {
                            buildLogoutModal(context);
                          },

                          color: Colors.grey,
                          textColor: Colors.black,
                          loadingColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: controller.stream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                              child: Text(
                                  'Some error occurred ${snapshot.error}'));
                        }

                        if (snapshot.hasData) {
                          //get the data
                          QuerySnapshot querySnapshot = snapshot.data;
                          List<QueryDocumentSnapshot> documents =
                              querySnapshot.docs;
                          List<Map> items = documents.map((e) => e.data() as Map).toList();
                          return ListView.separated(
                            // scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => const Divider(),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              Map thisItem  =items[index];
                            return  Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Text(
                                    "${thisItem['posts']}",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  thisItem['imageUrl']==""
                                      ? SizedBox():Image.network( "${items[index]['imageUrl']}",
                                    // height: 150,
                                    // width: 150,
                                  ),
                                ]
                                  ),
                              );
                            }
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      }),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///logout function here
  buildLogoutModal(BuildContext context) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Obx(()=>
             AlertDialog(
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30, //50.w
                vertical: 30, //50.h
              ),
              content: SizedBox(
                width: 395,
                height: 440,
                child: Column(children: [
                  FormTextField2(
                    errortxt: controller.postError.value.isEmpty
                        ? null
                        : controller.postError.value,
                    textCapitalization: TextCapitalization.none,
                    hintText: 'Upload a picture and gist us',
                    //hintText: 'keleDevine001',
                    textInputAction: TextInputAction.next,
                    onChange: controller.clearPostError,
                    textInputType: TextInputType.text,
                    controller: controller.postController,
                    validator: (String) {}, headerText: '',
                    //isPassWordField: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                 InkWell(
                   onTap: ()async{
                   await controller.uploadImage();
                     print("${controller.file}" +"jkhjk");
                   },
                     child: Icon(Icons.upload)),

                  controller.file == null ?SizedBox():Image.memory(controller.file!.readAsBytesSync()),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    text: 'Proceed',
                    isLoading: controller.isLoading.value,
                    onTap: controller.active.value == appInactiveColor
                        ? () {}
                        : () async {
                      await controller.saveFile(controller.file);
                       Get.to(()=> HomeScreen());
                    },
                    color: controller.active.value,
                    textColor: Colors.white,
                    loadingColor: Colors.white,
                  ),
                ]),
              ),

            ),
          );
        });
  }
}
