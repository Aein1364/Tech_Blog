// ignore_for_file: file_names, must_be_immutable

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tec/components/myColors.dart';
import 'package:new_tec/components/myComponents.dart';

import '../../controllers/podcastController/podcastInfoFileController.dart';
import '../../controllers/podcastController/podcastListController.dart';
import '../../gen/assets.gen.dart';

class PodcastInfoScreen extends StatelessWidget {
  PodcastInfoScreen({super.key});
  PodcastListController podcastlistcontroller =
      Get.put(PodcastListController());
  PodcastInfoFileController podcastInfoFileController =
      Get.put(PodcastInfoFileController());

  final _index = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
            body: Obx(
      () => podcastInfoFileController.loading.value
          ? Stack(
              children: [
                Positioned.fill(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //poster
                        Stack(
                          children: [
                            MyContainerWithImage(
                                url: podcastlistcontroller
                                    .podcastList[_index].poster,
                                width: Get.width,
                                height: Get.height / 3.2,
                                borderRadius: 0,
                                hasGradient: true,
                                gradientColors: GradientColors.bestArticleBg,
                                beginGradientAlignment: Alignment.center,
                                endGradientAlignment: Alignment.topCenter),
                            Positioned(
                              top: 15,
                              right: 15,
                              left: 15,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await podcastInfoFileController.player
                                          .stop();
                                      podcastInfoFileController.startProgress();
                                      podcastInfoFileController.playing.value =
                                          false;
                                      podcastInfoFileController.progressState
                                          .value = const Duration(seconds: 0);
                                      podcastInfoFileController
                                          .selectedIndex.value = 0;
                                      Get.back();
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 250,
                                  ),
                                  const Icon(
                                    Icons.bookmark_outline_rounded,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Icon(
                                    Icons.share,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        //podcast title
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text(
                              'پادکست : ${podcastlistcontroller.podcastList[_index].title}',
                              style: textTheme.titleLarge),
                        ),
                        //podcast author
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                          child: Row(
                            children: [
                              Assets.img.icons.authorImage.image(scale: 2),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                podcastlistcontroller
                                    .podcastList[_index].publisher,
                                style: textTheme.titleMedium!
                                    .apply(color: const Color(0xff252525)),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                              itemCount: podcastInfoFileController
                                  .podcastInfoFileList.length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: index == 0 ? 0 : 10,
                                      bottom: index ==
                                              podcastInfoFileController
                                                      .podcastInfoFileList
                                                      .length -
                                                  1
                                          ? 20
                                          : 10),
                                  child: GestureDetector(
                                    onTap: () async {
                                      podcastInfoFileController.playing.value =
                                          true;
                                      podcastInfoFileController.startProgress();
                                      podcastInfoFileController
                                          .selectedIndex.value = index;
                                      await podcastInfoFileController.player
                                          .seek(Duration.zero,
                                              index: podcastInfoFileController
                                                  .selectedIndex.value);
                                      await podcastInfoFileController.player
                                          .play();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Assets.img.icons.microphone
                                            .image(width: 30, height: 30),
                                        Obx(
                                          () => SizedBox(
                                              width: Get.width - 120,
                                              child: Text(
                                                podcastInfoFileController
                                                    .podcastInfoFileList[index]
                                                    .title,
                                                style: index ==
                                                        podcastInfoFileController
                                                            .selectedIndex.value
                                                    ? textTheme.titleMedium!
                                                        .apply(
                                                            color: Colors.blue)
                                                    : textTheme.titleMedium,
                                              )),
                                        ),
                                        Text(
                                            podcastInfoFileController
                                                .podcastInfoFileList[index]
                                                .length,
                                            style: textTheme.titleMedium!.apply(
                                                color: const Color(0xff747474)))
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Obx(
                        () => MyContainerNoImage(
                            haswidth: true,
                            width: Get.width - 50,
                            height: Get.height / 7.2,
                            borderRadius: 20,
                            hasGradient: true,
                            gradientColors: GradientColors.bottomNavigation,
                            beginGradientAlignment: Alignment.centerLeft,
                            endGradientAlignment: Alignment.centerRight,
                            color: Colors.transparent,
                            hasColor: false,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Obx(
                                    () => ProgressBar(
                                      timeLabelTextStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                      thumbColor: Colors.amber,
                                      progressBarColor: Colors.deepOrange,
                                      baseBarColor: Colors.white,
                                      buffered: podcastInfoFileController
                                          .bufferState.value,
                                      progress: podcastInfoFileController
                                          .progressState.value,
                                      total: podcastInfoFileController
                                              .player.duration ??
                                          const Duration(seconds: 0),
                                      onSeek: (value) {
                                        podcastInfoFileController.player
                                            .seek(value);
                                      },
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        await podcastInfoFileController.player
                                            .seekToNext();
                                        podcastInfoFileController
                                            .startProgress();
                                        podcastInfoFileController
                                                .selectedIndex.value =
                                            podcastInfoFileController
                                                .player.currentIndex!;
                                      },
                                      child: const Icon(
                                        Icons.skip_next_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    podcastInfoFileController.playing.value
                                        ? GestureDetector(
                                            onTap: () async {
                                              await podcastInfoFileController
                                                  .player
                                                  .pause();
                                              podcastInfoFileController
                                                  .playing.value = false;
                                            },
                                            child: const Icon(
                                              Icons.pause_circle_filled_rounded,
                                              color: Colors.white,
                                              size: 50,
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              if (podcastInfoFileController
                                                      .timer ==
                                                  null) {
                                                podcastInfoFileController
                                                    .startProgress();
                                              }
                                              podcastInfoFileController.player
                                                  .play();
                                              podcastInfoFileController
                                                  .playing.value = true;
                                            },
                                            child: const Icon(
                                              Icons.play_circle_fill_rounded,
                                              color: Colors.white,
                                              size: 50,
                                            ),
                                          ),
                                    GestureDetector(
                                      onTap: () async {
                                        podcastInfoFileController
                                            .startProgress();

                                        await podcastInfoFileController.player
                                            .seekToPrevious();

                                        podcastInfoFileController
                                                .selectedIndex.value =
                                            podcastInfoFileController
                                                .player.currentIndex!;
                                      },
                                      child: const Icon(
                                        Icons.skip_previous_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(),
                                    Obx(
                                      () => GestureDetector(
                                        onTap: () async {
                                          await podcastInfoFileController
                                              .loopMode();
                                        },
                                        child: Icon(
                                          Icons.repeat_rounded,
                                          color: podcastInfoFileController
                                                  .loopAll.value
                                              ? Colors.blue
                                              : Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ))
              ],
            )
          : SizedBox(
              width: Get.width,
              height: Get.height,
              child: const Center(child: Loading())),
    )));
  }
}
