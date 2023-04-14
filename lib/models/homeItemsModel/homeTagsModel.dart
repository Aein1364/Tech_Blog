// ignore_for_file: file_names

class HomeTagsModel {
  late String id;
  late String title;

  HomeTagsModel();

  HomeTagsModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'].toString();
  }
}
