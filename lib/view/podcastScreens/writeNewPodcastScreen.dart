// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:new_tec/components/myComponents.dart';
import 'package:new_tec/controllers/filePickerController.dart';
import 'package:new_tec/controllers/podcastController/PodcastManagementController.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../components/myColors.dart';
import '../../components/myStrings.dart';
import '../../gen/assets.gen.dart';
import '../../services/filePicker.dart';
import '../mainScreen.dart';

class WriteNewPodcastScreen extends StatelessWidget {
  WriteNewPodcastScreen({super.key});
  FilePickerController filePickerController = Get.put(FilePickerController());
  PodcastManagementController podcastManagementController =
      Get.put(PodcastManagementController());

  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //poster
                Stack(
                  children: [
                    filePickerController.file.value.name == 'nothing'
                        ? MyContainerWithImage(
                            url:
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png'
                            // : filePickerController.file.value.path!,
                            ,
                            width: Get.width,
                            height: Get.height / 3,
                            borderRadius: 0,
                            hasGradient: true,
                            gradientColors: GradientColors.bestArticleBg,
                            beginGradientAlignment: Alignment.center,
                            endGradientAlignment: Alignment.topCenter,
                          )
                        : Image.file(
                            File(
                              filePickerController.file.value.path!,
                            ),
                          ),
                    Positioned(
                      top: 10,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => MainScreen());
                        },
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            await pickFile();
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                          backgroundColor: SolidColors.primeryColor,
                          title: 'ویرایش عنوان پادکست',
                          titleStyle: const TextStyle(color: Colors.white),
                          content: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  height: 50,
                                  child: TextField(
                                    controller: podcastManagementController
                                        .titleController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'عنوان را وارد کنید',
                                        hintStyle: const TextStyle(
                                            color: Colors.black, fontSize: 12),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    style: ButtonStyle(overlayColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.redAccent;
                                      } else {
                                        return Colors.white;
                                      }
                                    })),
                                    onPressed: () {
                                      podcastManagementController
                                              .titleController.value.text !=
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
                                        MaterialStateProperty.resolveWith(
                                            (states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.green;
                                      } else {
                                        return Colors.white;
                                      }
                                    })),
                                    onPressed: () {
                                      podcastManagementController.title.value =
                                          podcastManagementController
                                              .titleController.text;
                                      Get.back();

                                      log(podcastManagementController
                                          .titleController.text);
                                    },
                                    child: const Text(
                                      'تایید',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ));
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
                          MyStrings.podcastEditing,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: Text(
                    podcastManagementController.title.value == ''
                        ? 'پادکست : اسم پادکست اینجا قرار می‌گیره'
                        : 'پادکست: ${podcastManagementController.titleController.text}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      isScrollControlled: true,
                      Container(
                        height: Get.height / 2,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Assets.img.monkey.svg(
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'لطفا زمان و فایل قسمت جدید پادکست رو وارد کن',
                                    style: textTheme.titleMedium!.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  controller: podcastManagementController
                                      .fileTitleController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        top: 5, right: 10),
                                    border: const OutlineInputBorder(),
                                    hintText: 'عنوان قسمت',
                                    hintStyle: textTheme.titleSmall!.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await pickPodcastFile();
                                    },
                                    child: Column(
                                      children: [
                                        Assets.img.icons.addfile.image(
                                          width: 40,
                                          height: 40,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'انتخاب فایل صوتی',
                                          style:
                                              textTheme.titleMedium!.copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Obx(
                                    () => Column(
                                      children: [
                                        SizedBox(
                                          height: Get.height / 6,
                                          width: 60,
                                          child: NumberPicker(
                                            haptics: true,
                                            minValue: 0,
                                            maxValue: 60,
                                            value: podcastManagementController
                                                .currentSecondeValue.value,
                                            onChanged: (value) =>
                                                podcastManagementController
                                                    .currentSecondeValue
                                                    .value = value,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text('ثانیه'),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    ':',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Obx(
                                    () => Column(
                                      children: [
                                        SizedBox(
                                          height: Get.height / 6,
                                          width: 60,
                                          child: NumberPicker(
                                            haptics: true,
                                            minValue: 0,
                                            maxValue: 60,
                                            value: podcastManagementController
                                                .currentMinuteValue.value,
                                            onChanged: (value) =>
                                                podcastManagementController
                                                    .currentMinuteValue
                                                    .value = value,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text('دقیقه'),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    ':',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Obx(
                                    () => Column(
                                      children: [
                                        SizedBox(
                                          height: Get.height / 6,
                                          width: 60,
                                          child: NumberPicker(
                                            haptics: true,
                                            minValue: 0,
                                            maxValue: 12,
                                            value: podcastManagementController
                                                .currentHourValue.value,
                                            onChanged: (value) =>
                                                podcastManagementController
                                                    .currentHourValue
                                                    .value = value,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text('ساعت'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                    log(filePickerController
                                        .podcastFile.value.path!
                                        .toString());
                                    log(podcastManagementController
                                        .currentMinuteValue.value
                                        .toString());
                                    log(podcastManagementController
                                        .currentSecondeValue.value
                                        .toString());
                                    log(podcastManagementController
                                        .fileTitleController.value.text);
                                  },
                                  child: const Text('تایید'))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          MyStrings.addFile,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Assets.img.icons.microphone.image(width: 30, height: 30),
                      SizedBox(
                          width: Get.width - 120,
                          child: Text(
                            podcastManagementController
                                .fileTitleController.text,
                            style: textTheme.titleMedium,
                          )),
                      Text(
                          '${podcastManagementController.currentHourValue.value}:${podcastManagementController.currentMinuteValue.value}:${podcastManagementController.currentSecondeValue.value}',
                          style: textTheme.titleMedium)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                SizedBox(
                    width: Get.width,
                    child: Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              await podcastManagementController
                                  .postPodcastFile();
                              await podcastManagementController
                                  .postPodcastTitle();
                              await podcastManagementController
                                  .updatePodcastPoster();
                            },
                            child: podcastManagementController.loading.value
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

// final player = AudioPlayer();
// late List playList;
// play() {
//   playList.add(ConcatenatingAudioSource(children: [
//     AudioSource.uri(Uri.parse(filePickerController.podcastFile.value.path!))
//   ]));
//   player.setAudioSource(playList[0]);
//   log(player.duration!.inSeconds.toString());
// }
