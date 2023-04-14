// ignore_for_file: file_names

import 'package:new_tec/components/apiComponent.dart';

class HomeTopPodcastModel {
  late String id;
  late String title;
  late String poster;
  late String catName;
  late String author;
  late String view;
  late String status;
  late String createdAt;

  HomeTopPodcastModel();

  HomeTopPodcastModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'].toString();
    poster = element['poster'] == null
        ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png'
        : ApiComponent.hostDlUrl + element['poster'];
    catName = element['cat_name'].toString();
    author = element['author'].toString();
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
  }
}
