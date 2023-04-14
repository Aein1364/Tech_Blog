// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_tec/components/apiComponent.dart';
import 'package:new_tec/components/storageConst.dart';
import 'package:new_tec/controllers/homeItemsController.dart';

import 'package:new_tec/services/filePicker.dart';

import '../services/dioService.dart';
import 'package:dio/dio.dart' as dio;

class WriteArticleController extends GetxController {
  HomeItemsController homeItemsController = Get.put(HomeItemsController());
  TextEditingController articleTitleController = TextEditingController();
  TextEditingController articleContentController = TextEditingController();
  RxString catId = RxString('');
  RxString articleContent = RxString(
      '''من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی''');
  RxBool articleTitle = RxBool(false);
  RxBool loading = RxBool(true);
  postArticle() async {
    loading.value = false;
    Map<String, dynamic> map = {
      'title': articleTitleController.text,
      'content': articleContent.value,
      'cat_id': catId.value,
      'user_id': GetStorage().read(StorageConst.userId),
      'image': await dio.MultipartFile.fromFile(
          filePickerController.file.value.path!),
      'command': 'store',
      'tag_list': '[]',
    };
    var response = await Dioservice()
        .postMethod('${ApiComponent.baseUrl}article/post.php', map);
    log(response.data.toString());
    loading.value = true;
  }
}
