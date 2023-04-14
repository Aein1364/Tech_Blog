// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tec/controllers/podcastController/podcastInfoFileController.dart';
import 'package:new_tec/controllers/podcastController/podcastListController.dart';
import 'package:new_tec/view/articleScreens/articleInfoScreen.dart';
import 'package:new_tec/view/articleScreens/articleListScreen.dart';
import 'package:new_tec/view/podcastScreens/podcastInfoScreen.dart';
import 'package:new_tec/view/podcastScreens/podcastListScreen.dart';

import '../components/myColors.dart';
import '../components/myComponents.dart';
import '../components/myStrings.dart';
import '../controllers/articleController/articleInfoController.dart';
import '../controllers/articleController/articleListController.dart';
import '../controllers/homeItemsController.dart';
import '../gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.homeItemsController,
    required this.textTheme,
  });

  final HomeItemsController homeItemsController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeItemsController.loading.value
          ? Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      //poster
                      Stack(
                        children: [
                          MyContainerWithImage(
                            url: homeItemsController.homePoster.value.image,
                            width: Get.width * .85,
                            height: Get.height / 4.5,
                            borderRadius: 20,
                            hasGradient: true,
                            gradientColors: GradientColors.bestArticleBg,
                            beginGradientAlignment: Alignment.center,
                            endGradientAlignment: Alignment.bottomCenter,
                          ),
                          Positioned(
                              bottom: 20,
                              left: 20,
                              right: 20,
                              child: Text(
                                  homeItemsController.homePoster.value.title,
                                  style: textTheme.labelLarge)),
                        ],
                      ),
                      //tag list
                      TagList(
                          homeItemsController: homeItemsController,
                          textTheme: textTheme),
                      //top visited title
                      GestureDetector(
                        onTap: () => Get.to(() => ArticleListScreen()),
                        child: Padding(
                          padding: EdgeInsets.only(right: Get.width * .075),
                          child: Row(
                            children: [
                              Assets.img.icons.pen.image(
                                width: 20,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(MyStrings.viewHotestBlog,
                                  style: textTheme.headlineLarge),
                            ],
                          ),
                        ),
                      ),

                      //top visited list
                      TopVisitedList(
                          homeItemsController: homeItemsController,
                          textTheme: textTheme),
                      SizedBox(
                        height: Get.height / 36,
                      ),
                      //top podcast title
                      Padding(
                        padding: EdgeInsets.only(right: Get.width * .075),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const PodcastListScreen());
                          },
                          child: Row(
                            children: [
                              Assets.img.icons.microphone.image(
                                width: 20,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(MyStrings.viewHotestpodcasts,
                                  style: textTheme.headlineLarge),
                            ],
                          ),
                        ),
                      ),

                      //top podcast list
                      TopPodcastList(
                          homeItemsController: homeItemsController,
                          textTheme: textTheme)
                    ],
                  ),
                ),
                // matted container
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: MyContainerNoImage(
                    haswidth: true,
                    width: Get.width,
                    height: Get.height / 14,
                    borderRadius: 0,
                    hasGradient: true,
                    gradientColors: GradientColors.downside,
                    beginGradientAlignment: Alignment.bottomCenter,
                    endGradientAlignment: Alignment.topCenter,
                    color: Colors.transparent,
                    hasColor: false,
                    child: const SizedBox(),
                  ),
                ),
              ],
            )
          : SizedBox(
              width: Get.width,
              height: Get.height,
              child: const Center(child: Loading())),
    );
  }
}

class TopPodcastList extends StatelessWidget {
  TopPodcastList({
    super.key,
    required this.homeItemsController,
    required this.textTheme,
  });

  final HomeItemsController homeItemsController;
  final TextTheme textTheme;
  PodcastInfoFileController podcastInfoFileController =
      Get.put(PodcastInfoFileController());
  PodcastListController podcastListController =
      Get.put(PodcastListController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 120),
      child: SizedBox(
        height: Get.width / 2.5,
        child: ListView.builder(
            itemCount: homeItemsController.homeTopPodcast.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index == 0 ? Get.width * .075 : 10,
                  left: index ==
                          homeItemsController.homeTopVisitedArticle.length - 1
                      ? Get.width * .075
                      : 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    podcastListController.getPodcastList();
                    podcastInfoFileController.getPodcastInfoFileList(
                        id: podcastListController.podcastList[index].id);
                    Get.to(() => PodcastInfoScreen(), arguments: index);
                  },
                  child: Column(
                    children: [
                      MyContainerWithImage(
                          url: homeItemsController.homeTopPodcast[index].poster,
                          width: Get.width / 3.3,
                          height: Get.width / 3.3,
                          borderRadius: 20,
                          hasGradient: false,
                          gradientColors: GradientColors.bestArticleBg,
                          beginGradientAlignment: Alignment.bottomLeft,
                          endGradientAlignment: Alignment.bottomCenter),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Text(
                          homeItemsController.homeTopPodcast[index].title,
                          style: textTheme.titleMedium,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class TopVisitedList extends StatelessWidget {
  TopVisitedList({
    super.key,
    required this.homeItemsController,
    required this.textTheme,
  });

  final HomeItemsController homeItemsController;
  final TextTheme textTheme;
  ArticleInfoController articleInfoController =
      Get.put(ArticleInfoController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
          height: Get.width / 2,
          child: ListView.builder(
              itemCount: homeItemsController.homeTopVisitedArticle.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == 0 ? Get.width * .075 : 10,
                    left: index ==
                            homeItemsController.homeTopVisitedArticle.length - 1
                        ? Get.width * .075
                        : 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      articleInfoController.getArticleInfo(
                          homeItemsController.homeTopVisitedArticle[index].id);
                      Get.to(() => ArticleInfoScreen());
                    },
                    child: SizedBox(
                      width: Get.width / 2.8,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              MyContainerWithImage(
                                  url: homeItemsController
                                      .homeTopVisitedArticle[index].image,
                                  width: Get.width / 2.8,
                                  height: Get.width / 3,
                                  borderRadius: 20,
                                  hasGradient: true,
                                  gradientColors: GradientColors.hotestBg,
                                  beginGradientAlignment: Alignment.center,
                                  endGradientAlignment: Alignment.bottomCenter),
                              Positioned(
                                bottom: 15,
                                right: 10,
                                left: 10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      homeItemsController
                                          .homeTopVisitedArticle[index].author,
                                      style: textTheme.labelMedium!
                                          .copyWith(fontSize: 12),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          homeItemsController
                                              .homeTopVisitedArticle[index]
                                              .view,
                                          style: textTheme.labelMedium!
                                              .copyWith(fontSize: 12),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 3, right: 5),
                                          child: Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Text(
                              homeItemsController
                                  .homeTopVisitedArticle[index].title,
                              style: textTheme.titleMedium,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.ltr,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}

class TagList extends StatelessWidget {
  TagList({
    super.key,
    required this.homeItemsController,
    required this.textTheme,
  });

  final HomeItemsController homeItemsController;
  final TextTheme textTheme;
  ArticleListController articleListController =
      Get.put(ArticleListController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 15, bottom: Get.height / 18),
      child: SizedBox(
          height: Get.width / 11,
          child: ListView.builder(
              itemCount: homeItemsController.tagsList.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == 0 ? Get.width * .075 : 10,
                    left: index == homeItemsController.tagsList.length - 1
                        ? Get.width * .075
                        : 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      articleListController.getArticleListWithTagId(
                          homeItemsController.tagsList[index].id);
                      Get.to(() => ArticleListScreen());
                    },
                    child: MyContainerNoImage(
                      width: Get.width / 4,
                      height: Get.width / 10,
                      borderRadius: Get.width / 20,
                      hasGradient: true,
                      gradientColors: GradientColors.hashtagBg,
                      beginGradientAlignment: Alignment.centerRight,
                      endGradientAlignment: Alignment.centerLeft,
                      haswidth: false,
                      color: Colors.transparent,
                      hasColor: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(homeItemsController.tagsList[index].title,
                            style: textTheme.labelMedium),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
