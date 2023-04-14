// ignore_for_file: file_names

import 'package:new_tec/components/apiComponent.dart';

class ArticleListModel {
  late String id;
  late String title;
  late String image;
  late String catId;
  late String catName;
  late String author;
  late String view;
  late String status;
  late bool isFavorite;
  late String createdAt;

  ArticleListModel();

  ArticleListModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'].toString();
    image = element['image'] == null
        ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png'
        : ApiComponent.hostDlUrl + element['image'];
    catId = element['cat_id'];
    catName = element['cat_name'];
    author = element['author'].toString();
    view = element['view'];
    status = element['status'];
    isFavorite = element['isFavorite'];
    createdAt = element['created_at'];
  }
}

// "id": "16",
//         "title": "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد",
//         "image": "/Techblog/assets/upload/images/article/20220904181457.jpg",
//         "cat_id": "3",
//         "cat_name": "اخبار بازی",
//         "author": "محسن چگینی",
//         "view": "1357",
//         "status": "1",
//         "isFavorite": false,
//         "created_at": "۱۴۰۱/۶/۱۲"