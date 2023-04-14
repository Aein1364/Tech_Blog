// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:new_tec/components/apiComponent.dart';
import 'package:new_tec/models/articleModel/articleListModel.dart';
import 'package:new_tec/services/dioService.dart';

class ArticleListController extends GetxController {
  RxList<ArticleListModel> articleList = RxList();
  RxBool loading = true.obs;

  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    loading.value = false;
    var response = await Dioservice().getMethod(
        '${ApiComponent.baseUrl}article/get.php?command=new&user_id=1');
    if (response.statusCode == 200) {
      articleList.clear();
      for (var element in response.data) {
        articleList.add(ArticleListModel.fromJson(element));
      }

      loading.value = true;
    }
  }

  getArticleListWithTagId(String tagId) async {
    loading.value = false;
    var response = await Dioservice().getMethod(
        '${ApiComponent.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$tagId&user_id=1');
    if (response.statusCode == 200) {
      articleList.clear();
      for (var element in response.data) {
        articleList.add(ArticleListModel.fromJson(element));
      }
    }
    loading.value = true;
  }
}
