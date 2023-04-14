// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_tec/components/apiComponent.dart';
import 'package:new_tec/components/myStrings.dart';
import 'package:new_tec/components/storageConst.dart';

import 'package:new_tec/gen/fonts.gen.dart';
import 'package:new_tec/services/dioService.dart';

import 'package:new_tec/view/articleScreens/articleListScreen.dart';
import 'package:new_tec/view/emptyStateArticleManagementScreen.dart';
import 'package:new_tec/view/mainScreen.dart';
import 'package:new_tec/view/registerScreen.dart';

import '../gen/assets.gen.dart';
import 'articleController/articleListPublisheByMeController.dart';

ArticleListPublishedByMeController articleListPublishedByMeController =
    Get.put(ArticleListPublishedByMeController());

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController activationCodeController = TextEditingController();
  final box = GetStorage();
  emailPostMethod() async {
    var response = await Dioservice()
        .postMethod('${ApiComponent.baseUrl}register/action.php', {
      'email': emailController.text,
      'command': 'register',
    });
    if (response.statusCode == 200) {
      box.write(StorageConst.userId, response.data['user_id']);
      box.write(StorageConst.response, response.data['response']);
      debugPrint(box.read(StorageConst.userId).toString());
      debugPrint(box.read(StorageConst.response).toString());
      log(response.data.toString());
      return response;
    }
  }

  verifyCodePostMethod() async {
    var response = await Dioservice()
        .postMethod('${ApiComponent.baseUrl}register/action.php', {
      'email': emailController.text,
      'user_id': box.read(StorageConst.userId),
      'code': activationCodeController.text,
      'command': 'verify',
    });
    if (response.data['response'] == 'verified') {
      box.write(StorageConst.token, response.data['token']);
      debugPrint('userID ::: ${box.read(StorageConst.userId).toString()}');
      debugPrint('token ::: ${box.read(StorageConst.token).toString()}');
      log(response.data.toString());
      Get.snackbar(
        'تبریک',
        'ثبت نام شما با موفقیت انجام شد',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
      );
      Get.offAll(() => MainScreen());
      return response;
    } else if (response.data['response'] == 'incorrect_code') {
      Get.snackbar(
        'خطا',
        'کد وارد شده صحیح نمی باشد',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
      );
    } else {
      Get.snackbar('خطا', 'زمان شما منقضی شده است',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ));
    }
  }

  registerMethod() async {
    if (GetStorage().read(StorageConst.token) == null) {
      Get.to(() => RegisterScreen());
    } else {
      Get.bottomSheet(
          backgroundColor: Colors.transparent,
          Container(
            width: Get.width,
            height: Get.height / 3,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Assets.img.monkey.svg(width: 40, height: 40),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'دونسته هات رو با بقیه به اشتراک بذار ...',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontFamily.dana,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    '''فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..''',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: FontFamily.dana,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          debugPrint(GetStorage().read(StorageConst.userId));
                          if (articleListPublishedByMeController
                              .articleList.isEmpty) {
                            Get.to(() =>
                                const EmptyStateArticleManagementScreen());
                          } else {
                            Get.to(() => ArticleListScreen());
                          }
                        },
                        child: GestureDetector(
                          child: SizedBox(
                            child: Row(
                              children: [
                                Assets.img.icons.articleEditing
                                    .image(width: 40, height: 40),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  MyStrings.articleManagement,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: FontFamily.dana,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Assets.img.icons.podcastMicrophone
                              .image(width: 40, height: 40),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            MyStrings.podcastsManagement,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: FontFamily.dana,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
      debugPrint("already registered");
    }
  }
}
