import 'package:classtek/Models/news.dart';
import 'package:classtek/Models/teacher.dart';
import 'package:dio/dio.dart';

class NewsRepo {
  static Future<List<NMessage>> getAllNews(String groupId) async {
    try {
      var response = await Dio().get(
        'https://schoolsystemmanagement-production-9724.up.railway.app/news/ofGroup/$groupId',
      );
      var news = NewsOfGroup.fromJson(response.data);
      if (news.success! && news.message!.isNotEmpty) return news.message!;
    } catch (e) {
      print(e);
    }

    return [
      NMessage(
          object: "No News yet",
          message: "It may be out of connection or There are no news",
          sender: TMessage(name: "Classtek", lastName: "App"))
    ];
  }
  //static Future<bool?> postNews(NewsOfGroup news) {}
}
