import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socialmedia/utils/indexes.dart';

import '../components/app_colors.dart';


class DashboardController extends GetxController{
  var isLoading = false.obs;
  var active = appInactiveColor.obs;
  final postController = TextEditingController();
  var postError = "".obs;

  CollectionReference _reference =
  FirebaseFirestore.instance.collection('post');

  late Stream<QuerySnapshot> stream;

  @override
  void onInit() async {
    stream = _reference.snapshots();
    super.onInit();
  }

  clearPostError(val) {
    enableButtonColor();
    return postError.value = "";
  }

  bool isShowing= true;



  enableButtonColor(){
    if(postController.text.isNotEmpty){
      active.value = appPrimaryTwoColor;
    }
    else{
      active.value = appInactiveColor;
    }
  }

  var imageUrl = ''.obs;





  var  files = ''.obs;
   File? file;
  uploadImage() async {

    final _imagePicker = ImagePicker();
    XFile? image;
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;
  //  if (permissionStatus.isGranted) {
      //Select Image
      image = await _imagePicker.pickImage(source: ImageSource.gallery);
        file = File(image!.path);
    files.value = file!.path;
    print("${file?.path}");
    print("${files}");

  }
  var downloadUrl =''.obs;
    saveFile(File file) async {

      String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference referenceRoot=  FirebaseStorage.instance.ref();
      Reference referenceDirImages  =referenceRoot.child('images');
      Reference referenceImageToUpload  = referenceDirImages.child(uniqueName);
      try{
        await referenceImageToUpload.putFile(file);
        imageUrl.value = await referenceImageToUpload.getDownloadURL();

        Map<String, String> dataToSend = {
          'posts': postController.text.trim(),
          'imageUrl': imageUrl.value,
        };

        //Add a new item
        _reference.add(dataToSend);
      }catch (error){

      }
    }
  var allFeedresult;
    Future<void> allFeeds()async {
      allFeedresult = await FirebaseStorage.instance.ref().listAll();

      print(allFeedresult);

    }




}