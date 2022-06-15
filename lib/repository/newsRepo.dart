import 'package:classtek/Models/news.dart';
import 'package:dio/dio.dart';

class NewsRepo {
  static Future<List<NewsOfGroup?>> getAllNews(int groupId) async {
    try {
      var response = await Dio().get(
        'https://schoolsystemmanagement-production-9724.up.railway.app/news/ofGroup/$groupId',
      );
      var s = NewsOfGroup.fromJson(response.data);

      var list = response.data as List;
      if (student.success!) return student.message;
    } catch (e) {
      print(e);
    }
    return null;
  }
  //static Future<bool?> postNews(NewsOfGroup news) {}
}
