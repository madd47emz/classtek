import 'package:classtek/Models/groupTeacher.dart';
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

  static Future<List<TGroup>> getGroup(String teacherId) async {
    try {
      var response = await Dio().get(
        'https://schoolsystemmanagement-production-9724.up.railway.app/teacher/$teacherId/groups',
      );
      var groups = GroupOfTeacher.fromJson(response.data);
      if (groups.success! && groups.message!.isNotEmpty) return groups.message!;
    } catch (e) {
      print(e);
    }

    return [];
  }

  static Future<bool> postNews(
      NMessage news, String id, List<String> groups) async {
    try {
      var response = await Dio().post(
          'https://schoolsystemmanagement-production-9724.up.railway.app/news/create',
          data: {
            'teacher_Id': id,
            'object': news.object,
            'message': news.message,
            'groups': groups
          });

      return response.data['success'];
    } catch (e) {
      print(e);
    }
    return false;
  }
}
