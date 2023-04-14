// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:new_tec/components/myColors.dart';
import 'package:new_tec/components/myStrings.dart';
import 'package:new_tec/controllers/articleInfoController.dart';
import 'package:new_tec/controllers/articleListController.dart';
import 'package:new_tec/view/articleListScreen.dart';

import '../components/myComponents.dart';
import '../controllers/homeItemsController.dart';
import '../gen/assets.gen.dart';

class ArticleInfoScreen extends StatelessWidget {
  ArticleInfoScreen({super.key});
  ArticleInfoController articleInfoController =
      Get.put(ArticleInfoController());

  ArticleListController articleListController =
      Get.put(ArticleListController());

  HomeItemsController homeItemsController = Get.put(HomeItemsController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => articleInfoController.loading.value
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //article poster
                      Stack(
                        children: [
                          MyContainerWithImage(
                              url:
                                  articleInfoController.articleInfo.value.image,
                              width: Get.width,
                              height: Get.height / 3.3,
                              borderRadius: 0,
                              hasGradient: true,
                              gradientColors: GradientColors.relatedArticleBg,
                              beginGradientAlignment: Alignment.topCenter,
                              endGradientAlignment: Alignment.center),
                          Positioned(
                            top: 10,
                            right: 15,
                            left: 15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    articleListController.getArticleList();
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_rounded,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                //bookmark and share
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Icon(
                                      Icons.bookmark_border_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.share,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          articleInfoController.articleInfo.value.title,
                          style: textTheme.titleLarge,
                        ),
                      ),
                      //author and date
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Assets.img.profile.image(width: 40),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              articleInfoController.articleInfo.value.author,
                              style: textTheme.titleMedium,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              articleInfoController.articleInfo.value.createdAt,
                              style: textTheme.titleMedium!
                                  .apply(color: const Color(0xff9B9B9B)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      //article content
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          articleInfoController.articleInfo.value.content,
                          style: textTheme.titleMedium!.copyWith(fontSize: 15),
                        ),
                      ),
                      // tag list
                      Padding(
                        padding: const EdgeInsets.only(top: 60, bottom: 30),
                        child: SizedBox(
                          height: Get.height / 30,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: articleInfoController.tagList.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: index == 0 ? 20 : 10,
                                  left: index ==
                                          articleInfoController.tagList.length -
                                              1
                                      ? 20
                                      : 0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    articleListController
                                        .getArticleListWithTagId(
                                            articleInfoController
                                                .tagList[index].id);
                                    Get.to(() => ArticleListScreen());
                                  },
                                  child: MyContainerNoImage(
                                      haswidth: false,
                                      width: 0,
                                      height: Get.height / 10,
                                      borderRadius: 10,
                                      hasGradient: false,
                                      gradientColors: GradientColors.downside,
                                      beginGradientAlignment:
                                          Alignment.bottomCenter,
                                      endGradientAlignment:
                                          Alignment.bottomCenter,
                                      color: const Color.fromARGB(
                                          255, 237, 235, 235),
                                      hasColor: true,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          articleInfoController
                                              .tagList[index].title,
                                          style: textTheme.titleSmall!
                                              .copyWith(fontSize: 14),
                                        ),
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // related articles title
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 20, 30),
                        child: Text(
                          MyStrings.relatedArticle,
                          style: textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(
                          height: Get.width / 2,
                          child: ListView.builder(
                              itemCount: homeItemsController
                                  .homeTopVisitedArticle.length,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: index == 0 ? Get.width * .075 : 10,
                                    left: index ==
                                            homeItemsController
                                                    .homeTopVisitedArticle
                                                    .length -
                                                1
                                        ? Get.width * .075
                                        : 10,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      articleInfoController.getArticleInfo(
                                          homeItemsController
                                              .homeTopVisitedArticle[index].id);
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
                                                      .homeTopVisitedArticle[
                                                          index]
                                                      .image,
                                                  width: Get.width / 2.8,
                                                  height: Get.width / 3,
                                                  borderRadius: 20,
                                                  hasGradient: true,
                                                  gradientColors:
                                                      GradientColors.hotestBg,
                                                  beginGradientAlignment:
                                                      Alignment.center,
                                                  endGradientAlignment:
                                                      Alignment.bottomCenter),
                                              Positioned(
                                                bottom: 15,
                                                right: 10,
                                                left: 10,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      homeItemsController
                                                          .homeTopVisitedArticle[
                                                              index]
                                                          .author,
                                                      style: textTheme
                                                          .labelMedium!
                                                          .copyWith(
                                                              fontSize: 12),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          homeItemsController
                                                              .homeTopVisitedArticle[
                                                                  index]
                                                              .view,
                                                          style: textTheme
                                                              .labelMedium!
                                                              .copyWith(
                                                                  fontSize: 12),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 3,
                                                                  right: 5),
                                                          child: Icon(
                                                            Icons
                                                                .remove_red_eye_outlined,
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
                                                  .homeTopVisitedArticle[index]
                                                  .title,
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
                    ],
                  ),
                )
              : SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: const Center(child: Loading())),
        ),
      ),
    ));
  }
}
