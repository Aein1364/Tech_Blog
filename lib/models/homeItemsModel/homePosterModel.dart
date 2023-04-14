// ignore_for_file: file_names

import 'package:new_tec/components/apiComponent.dart';

class HomePosterModel {
  late String id;
  late String title;
  late String image;

  HomePosterModel();

  HomePosterModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'].toString();
    image = ApiComponent.hostDlUrl + element['image'];
  }
}
