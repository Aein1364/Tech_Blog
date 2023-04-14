// ignore_for_file: file_names, must_be_immutable

import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_tec/components/myColors.dart';
import 'package:new_tec/components/myComponents.dart';
import 'package:new_tec/components/myStrings.dart';
import 'package:new_tec/controllers/homeItemsController.dart';
import 'package:new_tec/services/filePicker.dart';
import 'package:new_tec/view/articleScreens/htmlScreen.dart';
import 'package:new_tec/view/mainScreen.dart';

import '../../controllers/writeArticleController.dart';
import '../../gen/assets.gen.dart';

class WriteArticleScreen extends StatelessWidget {
  WriteArticleScreen({super.key});
  WriteArticleController writeArticleController =
      Get.put(WriteArticleController());
  HomeItemsController homeItemsController = Get.put(HomeItemsController());
  RxString catChoosed = RxString('');
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image container
                Stack(
                  children: [
                    filePickerController.file.value.name == 'nothing'
                        ? MyContainerWithImage(
                            url:
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png',
                            width: Get.width,
                            height: Get.height / 3,
                            borderRadius: 0,
                            hasGradient: true,
                            gradientColors: GradientColors.bestArticleBg,
                            beginGradientAlignment: Alignment.center,
                            endGradientAlignment: Alignment.topCenter,
                          )
                        : Image.file(
                            File(filePickerController.file.value.path!)),
                    Positioned(
                        top: 10,
                        right: 20,
                        child: GestureDetector(
                            onTap: () {
                              // filePickerController.resetImage();
                              Get.to(() => MainScreen());
                            },
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              size: 30,
                              color: Colors.white,
                            ))),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            pickFile();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: Get.width / 3.5,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: SolidColors.primeryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'انتخاب تصویر',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Colors.white, fontSize: 12),
                                ),
                                const Icon(
                                  CupertinoIcons.plus,
                                  size: 20,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                //editing article title
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                  child: GestureDetector(
                    onTap: () {
                      writeArticleController.articleTitle.value = false;
                      Get.defaultDialog(
                        backgroundColor: SolidColors.primeryColor,
                        title: 'ویرایش عنوان مقاله',
                        titleStyle: const TextStyle(color: Colors.white),
                        content: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller:
                                writeArticleController.articleTitleController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'عنوان مقاله را وارد کنید',
                              hintStyle: const TextStyle(
                                  color: Colors.black, fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                            style: ButtonStyle(overlayColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.green;
                              } else {
                                return Colors.white;
                              }
                            })),
                            onPressed: () {
                              writeArticleController
                                      .articleTitleController.value.text !=
                                  '';
                              Get.back();
                            },
                            child: const Text(
                              'انصراف',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(overlayColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.green;
                              } else {
                                return Colors.white;
                              }
                            })),
                            onPressed: () {
                              Get.back();
                              writeArticleController.articleTitle.value = true;
                              log(writeArticleController
                                  .articleTitleController.text);
                            },
                            child: const Text(
                              'تایید',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                    child: Row(
                      children: [
                        Assets.img.icons.pen.image(
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          MyStrings.articleEditing,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
                //article title name
                writeArticleController.articleTitle.value
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          writeArticleController
                              .articleTitleController.value.text,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                //editing article content title
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => HtmlScreen());
                    },
                    child: Row(
                      children: [
                        Assets.img.icons.pen.image(
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ویرایش متن اصلی مقاله',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
                //article content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    writeArticleController.articleContent.value,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        CategoryBottomSheetContainer(
                          homeItemsController: homeItemsController,
                          catChoosed: catChoosed,
                          textTheme: textTheme,
                          writeArticleController: writeArticleController,
                        ),
                        isScrollControlled: true,
                      );
                    },
                    child: Row(
                      children: [
                        Assets.img.icons.pen.image(
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'انتخاب دسته بندی ',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
                  child: MyContainerNoImage(
                      haswidth: true,
                      width: 150,
                      height: 40,
                      borderRadius: 20,
                      hasGradient: false,
                      gradientColors: GradientColors.bestArticleBg,
                      beginGradientAlignment: Alignment.bottomCenter,
                      endGradientAlignment: Alignment.bottomLeft,
                      color: catChoosed.value == ''
                          ? Colors.transparent
                          : const Color.fromARGB(255, 233, 231, 231),
                      hasColor: true,
                      child: Text(
                        catChoosed.value,
                        style: textTheme.labelMedium!
                            .copyWith(color: Colors.black),
                      )),
                ),
                SizedBox(
                    width: Get.width,
                    child: Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              writeArticleController.postArticle();
                              debugPrint(
                                  'token ::: ${GetStorage().read('token')}');
                              debugPrint(
                                  'token ::: ${GetStorage().read('userId')}');
                            },
                            child: writeArticleController.loading.value
                                ? const Text('تموم شد')
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SizedBox(
                                      width: 180,
                                      height: 55,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('در حال ارسال مطلب'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                              height: 20,
                                              width: 20,
                                              child:
                                                  CircularProgressIndicator())
                                        ],
                                      ),
                                    ),
                                  ))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryBottomSheetContainer extends StatelessWidget {
  const CategoryBottomSheetContainer({
    super.key,
    required this.homeItemsController,
    required this.catChoosed,
    required this.textTheme,
    required this.writeArticleController,
  });

  final HomeItemsController homeItemsController;
  final WriteArticleController writeArticleController;
  final RxString catChoosed;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        height: Get.height * .7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.img.monkey.svg(
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'روی دسته بندی مرتبط ضربه بزن تا به مقاله اضافه بشه',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeItemsController.tagsList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 3,
                            childAspectRatio: .3),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          catChoosed.value =
                              homeItemsController.tagsList[index].title;
                          writeArticleController.catId.value =
                              homeItemsController.tagsList[index].id;
                          log(writeArticleController.catId.value.toString());
                        },
                        child: MyContainerNoImage(
                          haswidth: false,
                          width: 0,
                          height: 40,
                          borderRadius: Get.height / 16,
                          hasGradient: true,
                          gradientColors: GradientColors.hashtagBg,
                          beginGradientAlignment: Alignment.centerLeft,
                          endGradientAlignment: Alignment.centerRight,
                          color: Colors.transparent,
                          hasColor: false,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              homeItemsController.tagsList[index].title,
                              style: textTheme.labelMedium,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Assets.img.icons.flesh.svg(
                width: 50,
                height: 50,
              ),
            ),
            MyContainerNoImage(
                haswidth: true,
                width: 150,
                height: 40,
                borderRadius: 20,
                hasGradient: false,
                gradientColors: GradientColors.bestArticleBg,
                beginGradientAlignment: Alignment.bottomCenter,
                endGradientAlignment: Alignment.bottomLeft,
                color: catChoosed.value == ''
                    ? Colors.transparent
                    : const Color.fromARGB(255, 233, 231, 231),
                hasColor: true,
                child: Text(
                  catChoosed.value,
                  style: textTheme.labelMedium!.copyWith(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
