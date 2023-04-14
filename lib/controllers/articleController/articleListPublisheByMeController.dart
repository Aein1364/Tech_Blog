// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:new_tec/models/articleModel/articleListModel.dart';

import '../../components/apiComponent.dart';
import '../../services/dioService.dart';

class ArticleListPublishedByMeController extends GetxController {
  RxList<ArticleListModel> articleList = RxList();
  RxBool loading = RxBool(true);

  getArticleListPublishedByMe() async {
    loading.value = false;
    var response = await Dioservice().getMethod(
        '${ApiComponent.baseUrl}article/get.php?command=published_by_me&user_id=134}');
    if (response.statusCode == 200) {
      articleList.clear();
      for (var element in response.data) {
        articleList.add(ArticleListModel.fromJson(element));
      }
    }
    loading.value = true;
  }
}
