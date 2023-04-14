// ignore_for_file: file_names

import 'package:new_tec/components/apiComponent.dart';

class PodcastInfoFileModel {
  late String id;
  late String podcastId;
  late String file;
  late String title;
  late String length;
  PodcastInfoFileModel();
  PodcastInfoFileModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    podcastId = element['podcast_id'];
    file = ApiComponent.hostDlUrl + element['file'];
    title = element['title'];
    length = element['length'];
  }
}

//  "id": "13",
//             "podcast_id": "10",
//             "file": "/Techblog/assets/upload/images/podcast/files/20221205182512.mp3",
//             "title": "تکچی - قسمت 70 گوگل مورد تایید ما نیست!!!!",
//             "length": "28"