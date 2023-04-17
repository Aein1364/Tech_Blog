import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_tec/components/apiComponent.dart';
import 'package:new_tec/components/storageConst.dart';
import 'package:dio/dio.dart' as dio;
import 'package:new_tec/controllers/filePickerController.dart';
import 'package:new_tec/services/dioService.dart';

class PodcastManagementController extends GetxController {
  FilePickerController filePickerController = Get.put(FilePickerController());
  TextEditingController titleController = TextEditingController();
  TextEditingController fileTitleController = TextEditingController();
  RxInt currentHourValue = 0.obs;
  RxInt currentMinuteValue = 0.obs;
  RxInt currentSecondeValue = 0.obs;
  RxString title = ''.obs;
  RxBool loading = true.obs;
  postPodcastFile() async {
    loading.value = false;
    Map<String, dynamic> map = {
      'command': 'store_file',
      'podcast_id': '25',
      'title': fileTitleController.text,
      'length':
          '${currentHourValue.value}:${currentMinuteValue.value}:${currentSecondeValue.value}',
      'file': await dio.MultipartFile.fromFile(
          filePickerController.podcastFile.value.path!),
    };
    var response = await Dioservice()
        .postMethod('${ApiComponent.baseUrl}podcast/post.php', map);
    log(response.data.toString());
    loading.value = true;
  }

  postPodcastTitle() async {
    loading.value = false;
    Map<String, dynamic> map = {
      'user_id': GetStorage().read(StorageConst.userId),
      'title': titleController.text,
      'cat_id': '5',
      'command': 'store_title',
    };
    var response = await Dioservice()
        .postMethod('${ApiComponent.baseUrl}podcast/post.php', map);
    log(response.data.toString());
    loading.value = true;
  }

  updatePodcastPoster() async {
    loading.value = false;
    Map<String, dynamic> map = {
      'user_id': GetStorage().read(StorageConst.userId),
      'podcast_id': '25',
      'image':
          dio.MultipartFile.fromFile(filePickerController.file.value.path!),
      'command': 'update_poster',
    };
    var response = await Dioservice()
        .postMethod('${ApiComponent.baseUrl}podcast/post.php', map);
    log(response.data.toString());
    loading.value = true;
  }
}
