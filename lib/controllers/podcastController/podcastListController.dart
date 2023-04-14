// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:new_tec/models/podcastModels/podcastListModel.dart';

import '../../components/apiComponent.dart';
import '../../services/dioService.dart';

class PodcastListController extends GetxController {
  RxList<PodcastListModel> podcastList = RxList();
  RxBool loading = true.obs;
  @override
  onInit() {
    super.onInit();
    getPodcastList();
  }

  getPodcastList() async {
    loading.value = false;
    var response = await Dioservice().getMethod(
        '${ApiComponent.baseUrl}podcast/get.php?command=new&user_id=1');
    if (response.statusCode == 200) {
      podcastList.clear();
      for (var element in response.data) {
        podcastList.add(PodcastListModel.fromJson(element));
      }
    }
    loading.value = true;
  }
}
