// ignore_for_file: file_names, must_be_immutable, unrelated_type_equality_checks

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:new_tec/components/storageConst.dart';
import 'package:new_tec/controllers/registerController.dart';

import '../components/myStrings.dart';
import '../gen/assets.gen.dart';
import '../gen/fonts.gen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      height: Get.height,
      width: Get.width,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Get.height / 2.8,
              bottom: 20,
            ),
            child: Assets.img.monkey.svg(width: 80),
          ),
          const Text(
            textAlign: TextAlign.center,
            MyStrings.wellcomeText,
            style: TextStyle(
              fontSize: 15,
              fontFamily: FontFamily.dana,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: Get.height / 7,
          ),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Container(
                        height: Get.height / 2.3,
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 100, 0, 30),
                              child: Text(
                                'لطفا ایمیلت رو وارد کن',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: FontFamily.dana,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .8,
                              child: TextFormField(
                                controller: registerController.emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'لطفا ایمیلت رو وارد کن';
                                  } else if (!value.isEmail) {
                                    return 'لطفا ایمیلت رو به درستی وارد کن';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(right: 100),
                                  hintText: 'techblog@gmail.com',
                                  hintStyle: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: FontFamily.dana,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xffDBDBDB)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    registerController.emailPostMethod();
                                    if (StorageConst.response == true) {
                                      Get.snackbar(
                                        'با موفقیت ثبت شد',
                                        'لینک فعال سازی به ایمیلت ارسال شد',
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                        icon: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                      );
                                    }
                                    Get.offAll(() => RegisterScreen());
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom,
                                            ),
                                            child: Container(
                                              height: Get.height / 2.3,
                                              width: Get.width,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 100, 0, 30),
                                                    child: Text(
                                                      'کد فعال سازی رو وارد کن ',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily:
                                                            FontFamily.dana,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Get.width * .8,
                                                    child: TextFormField(
                                                      controller: registerController
                                                          .activationCodeController,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'لطفا کد فعالسازی رو وارد کن';
                                                        } else if (!value
                                                            .isNumericOnly) {
                                                          return 'لطفا کد فعالسازی رو به درستی وارد کن';
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 150),
                                                        hintText: '*******',
                                                        hintStyle:
                                                            const TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .dana,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                color: Color(
                                                                    0xffDBDBDB)),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 60, 0, 0),
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          registerController
                                                              .verifyCodePostMethod();
                                                        },
                                                        child: const Text(
                                                            'ادامه')),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: const Text('ادامه')),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  backgroundColor: Colors.white,
                );
              },
              child: const Text('بزن بریم'))
        ],
      ),
    )));
  }
}
