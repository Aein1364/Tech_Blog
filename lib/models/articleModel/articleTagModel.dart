// ignore_for_file: file_names

class ArticleTagModel {
  late String id;
  late String title;

  ArticleTagModel();
  ArticleTagModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'].toString();
  }
}

// "id": "1",
//             "title": "مقاله"