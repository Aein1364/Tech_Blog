// ignore_for_file: file_names

import 'package:new_tec/components/apiComponent.dart';

class HomeTopVisitedArticleModel {
  late String id;
  late String title;
  late String image;
  late String catId;
  late String catName;
  late String author;
  late String view;
  late String status;
  late String createdAt;

  HomeTopVisitedArticleModel();

  HomeTopVisitedArticleModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'].toString();
    image = element['image'] == null
        ? ApiComponent.hostDlUrl
        : ApiComponent.hostDlUrl + element['image'];
    catId = element['cat_id'];
    catName = element['cat_name'];
    author = element['author'].toString();
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
  }
}
