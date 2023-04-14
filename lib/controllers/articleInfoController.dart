// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:new_tec/models/articleModel/articleInfoModel.dart';
import 'package:new_tec/models/articleModel/articleTagModel.dart';
import 'package:new_tec/services/dioService.dart';

import '../components/apiComponent.dart';

class ArticleInfoController extends GetxController {
  Rx<ArticleInfoModel> articleInfo = ArticleInfoModel().obs;
  RxList<ArticleTagModel> tagList = RxList();
  RxBool loading = true.obs;

  getArticleInfo(String id) async {
    loading.value = false;
    var response = await Dioservice().getMethod(
        '${ApiComponent.baseUrl}article/get.php?command=info&id=$id&user_id=1');
    if (response.statusCode == 200) {
      articleInfo.value = ArticleInfoModel.fromJson(response.data['info']);
      for (var element in response.data['tags']) {
        tagList.add(ArticleTagModel.fromJson(element));
      }
      loading.value = true;
    }
  }
}
