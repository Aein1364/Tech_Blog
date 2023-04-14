// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:new_tec/components/myColors.dart';
import 'package:new_tec/components/myComponents.dart';

import 'package:new_tec/view/articleScreens/articleInfoScreen.dart';

import '../../controllers/articleController/articleInfoController.dart';
import '../../controllers/articleController/articleListController.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  ArticleListController articleListController =
      Get.put(ArticleListController());
  ArticleInfoController articleInfoController =
      Get.put(ArticleInfoController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Obx(
              () => articleListController.loading.value
                  ? Column(
                      children: [
                        // appbar
                        MyAppBar(
                          textTheme: textTheme,
                          title: 'لیست مقاله ها',
                        ),
                        //article list
                        ListView.builder(
                            itemCount: articleListController.articleList.length,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: index == 0 ? 30 : 15,
                                    bottom: index ==
                                            articleListController
                                                    .articleList.length -
                                                1
                                        ? 30
                                        : 15),
                                child: GestureDetector(
                                  onTap: () {
                                    articleInfoController.getArticleInfo(
                                        articleListController
                                            .articleList[index].id);
                                    Get.to(() => ArticleInfoScreen());
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //article image
                                      MyContainerWithImage(
                                          url: articleListController
                                              .articleList[index].image,
                                          width: Get.width / 4.2,
                                          height: Get.width / 4.15,
                                          borderRadius: 20,
                                          hasGradient: false,
                                          gradientColors:
                                              GradientColors.hashtagBg,
                                          beginGradientAlignment:
                                              Alignment.bottomCenter,
                                          endGradientAlignment:
                                              Alignment.bottomCenter),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            //article list title
                                            Text(
                                              articleListController
                                                  .articleList[index].title,
                                              style: textTheme.titleMedium,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // article list author
                                                Text(
                                                  articleListController
                                                      .articleList[index]
                                                      .author,
                                                  style: textTheme.titleSmall!
                                                      .copyWith(fontSize: 13),
                                                ),
                                                // article list view
                                                Text(
                                                  'بازدید ${articleListController.articleList[index].view}',
                                                  style: textTheme.titleSmall!
                                                      .copyWith(fontSize: 13),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                // article list category
                                                Text(
                                                  articleListController
                                                      .articleList[index]
                                                      .catName,
                                                  style: textTheme.titleSmall!
                                                      .copyWith(
                                                          color: Colors.blue,
                                                          fontSize: 13),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    )
                  : SizedBox(
                      width: Get.width,
                      height: Get.height,
                      child: const Center(child: Loading())),
            ),
          ),
        ),
      ),
    );
  }
}
