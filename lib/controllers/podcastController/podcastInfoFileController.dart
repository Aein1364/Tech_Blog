// ignore_for_file: file_names

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../components/apiComponent.dart';
import '../../models/podcastModels/podcastInfoFileModel.dart';
import '../../services/dioService.dart';

class PodcastInfoFileController extends GetxController {
  RxList<PodcastInfoFileModel> podcastInfoFileList = RxList();
  RxBool loading = true.obs;
  final player = AudioPlayer();
  // ignore: prefer_typing_uninitialized_variables
  late var playList;
  RxBool playing = false.obs;
  RxBool loopAll = RxBool(false);
  @override
  onInit() async {
    await getPodcastInfoFileList();

    super.onInit();
  }

  getPodcastInfoFileList({String? id}) async {
    loading.value = false;
    playList = ConcatenatingAudioSource(useLazyPreparation: true, children: []);
    await player.setAudioSource(playList,
        initialIndex: 0, initialPosition: Duration.zero);

    var response = await Dioservice().getMethod(
        '${ApiComponent.baseUrl}podcast/get.php?command=get_files&podcats_id=$id');
    if (response.statusCode == 200) {
      podcastInfoFileList.clear();
      for (var element in response.data['files']) {
        podcastInfoFileList.add(PodcastInfoFileModel.fromJson(element));
        playList.clear;
        playList.add(AudioSource.uri(
            Uri.parse(PodcastInfoFileModel.fromJson(element).file)));
      }
    }
    loading.value = true;
  }

  int? duration;
  RxInt selectedIndex = 0.obs;
  Rx<Duration> progressState = const Duration(seconds: 0).obs;
  Rx<Duration> totalDuration = const Duration(seconds: 0).obs;
  Rx<Duration> bufferState = const Duration(seconds: 0).obs;
  Timer? timer;
  startProgress() {
    const tick = Duration(seconds: 1);
    switch (player.duration) {
      case null:
        duration = 0;
        break;
      default:
        duration = player.duration!.inSeconds;
        break;
    }

    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
        timer = null;
      }
    }
    timer = Timer.periodic(tick, (timer) {
      if (player.position.inSeconds == duration) {
        timer.cancel();
      }
      if (player.playing) {
        progressState.value = player.position;

        bufferState.value = player.bufferedPosition;
        debugPrint('TIMER :: ${progressState.value}');
      }
    });
  }

  loopMode() async {
    if (loopAll.value) {
      loopAll.value = false;
      await player.setLoopMode(LoopMode.off);
    } else {
      loopAll.value = true;
      await player.setLoopMode(LoopMode.all);
    }
  }
}
