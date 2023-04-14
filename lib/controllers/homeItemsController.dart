// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:new_tec/components/apiComponent.dart';
import 'package:new_tec/models/homeItemsModel/HomePosterModel.dart';
import 'package:new_tec/models/homeItemsModel/homeTagsModel.dart';
import 'package:new_tec/models/homeItemsModel/homeTopPodcastModel.dart';
import 'package:new_tec/models/homeItemsModel/homeTopVisitedArticleModel.dart';
import 'package:new_tec/services/dioService.dart';

class HomeItemsController extends GetxController {
  Rx<HomePosterModel> homePoster = HomePosterModel().obs;
  RxList<HomeTopVisitedArticleModel> homeTopVisitedArticle = RxList();
  RxList<HomeTopPodcastModel> homeTopPodcast = RxList();
  RxList<HomeTagsModel> tagsList = RxList();
  RxBool loading = RxBool(true);
  @override
  onInit() {
    super.onInit();
    getMethod();
  }

  getMethod() async {
    loading.value = false;
    var response = await Dioservice()
        .getMethod('${ApiComponent.baseUrl}home/?command=index');
    if (response.statusCode == 200) {
      homePoster.value = HomePosterModel.fromJson(response.data['poster']);
      for (var element in response.data['tags']) {
        tagsList.add(HomeTagsModel.fromJson(element));
      }
      response.data['top_visited'].forEach((element) {
        homeTopVisitedArticle.add(HomeTopVisitedArticleModel.fromJson(element));
      });
      for (var element in response.data['top_podcasts']) {
        homeTopPodcast.add(HomeTopPodcastModel.fromJson(element));
      }
    }
    loading.value = true;
  }
}
