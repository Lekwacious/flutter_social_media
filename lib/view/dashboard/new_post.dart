
import 'package:socialmedia/utils/indexes.dart';

import '../../components/app_colors.dart';
import '../../components/auth_input_form.dart';
import '../../components/custom_button.dart';
import '../../components/scrow_behaviour.dart';
import '../../dashboard_controller/dashboard_contoller.dart';
import 'home.dart';

class NewPost extends StatelessWidget {
  final controller = Get.put(DashboardController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Create a new posts"),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ScrollConfiguration(
            behavior: RemoveScrollBubbleBehavior(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Obx(
                    () => ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
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

                        controller.file == null ?SizedBox():Container(width: 300,
                            child: Image.memory(controller.file!.readAsBytesSync())),
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
                            controller.clearPostError;
                            controller.file?.readAsBytesSync() ==null;
                          },
                          color: controller.active.value,
                          textColor: Colors.white,
                          loadingColor: Colors.white,
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

