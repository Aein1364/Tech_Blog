// ignore_for_file: file_names

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

RxString name = RxString('nothing');

class FilePickerController extends GetxController {
//  resetImage(){
// name.value='nothing';
//  }
  Rx<PlatformFile> file = PlatformFile(name: 'nothing', size: 0).obs;

  Rx<PlatformFile> podcastFile = PlatformFile(name: 'nothing', size: 0).obs;
}
