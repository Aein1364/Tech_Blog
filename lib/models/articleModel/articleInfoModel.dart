// ignore_for_file: file_names

import '../../components/apiComponent.dart';

class ArticleInfoModel {
  late String id;
  late String title;
  late String content;
  late String image;
  late String catId;
  late String catName;
  late String author;
  late String view;
  late String status;
  late String createdAt;

  ArticleInfoModel();
  ArticleInfoModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'].toString();
    content = element['content'].toString();
    image = element['image'] == null
        ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png'
        : ApiComponent.hostDlUrl + element['image'];
    catId = element['cat_id'];
    catName = element['cat_name'];
    author = element['author'].toString();
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
  }
}
