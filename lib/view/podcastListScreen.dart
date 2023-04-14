// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tec/components/myColors.dart';
import 'package:new_tec/components/myComponents.dart';
import 'package:new_tec/controllers/podcastListController.dart';

import 'package:new_tec/view/mainScreen.dart';
import 'package:new_tec/view/podcastInfoScreen.dart';

import '../controllers/podcastInfoFileController.dart';

class PodcastListScreen extends StatelessWidget {
  const PodcastListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PodcastListController podcastListController =
        Get.put(PodcastListController());
    PodcastInfoFileController podcastInfoFileController =
        Get.put(PodcastInfoFileController());
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => MainScreen()),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: SolidColors.primeryColor2,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'لیست پادکست ها',
                      style: textTheme.titleMedium!
                          .apply(color: SolidColors.primeryColor),
                    )
                  ],
                ),
              ),
              Obx(
                () => podcastListController.loading.value
                    ? ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: podcastListController.podcastList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: index == 0 ? 0 : 10,
                                bottom: index ==
                                        podcastListController
                                                .podcastList.length -
                                            1
                                    ? 0
                                    : 10),
                            child: GestureDetector(
                              onTap: () {
                                podcastInfoFileController
                                    .getPodcastInfoFileList(
                                        id: podcastListController
                                            .podcastList[index].id);
                                Get.to(() => PodcastInfoScreen(),
                                    arguments: index);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: podcastListController
                                        .podcastList[index].poster,
                                    progressIndicatorBuilder:
                                        (context, url, progress) =>
                                            const Loading(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.image_not_supported,
                                      color: Colors.grey,
                                    ),
                                    imageBuilder: (context, imageProvider) {
                                      return SizedBox(
                                        width: Get.width / 4.17,
                                        height: Get.width / 4.1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        podcastListController
                                            .podcastList[index].title,
                                        style: textTheme.titleMedium,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        podcastListController
                                            .podcastList[index].publisher,
                                        style: textTheme.titleSmall!.copyWith(
                                            color: const Color(0xff616161),
                                            fontSize: 13),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'بازدید ${podcastListController.podcastList[index].view}',
                                        style: textTheme.titleSmall!.copyWith(
                                            color: const Color(0xff616161),
                                            fontSize: 13),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                    : SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: const Center(child: Loading())),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
