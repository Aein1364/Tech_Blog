// ignore_for_file: file_names

import 'package:new_tec/components/apiComponent.dart';

class PodcastListModel {
  late String id;
  late String title;
  late String poster;
  late String publisher;
  late String view;
  late String status;
  late String createdAt;
  late bool isFavorite;

  PodcastListModel();

  PodcastListModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'].toString();
    poster = element['poster'] == null
        ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png'
        : ApiComponent.hostDlUrl + element['poster'];

    publisher = element['publisher'].toString();
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
    isFavorite = element['isFavorite'];
  }
}
