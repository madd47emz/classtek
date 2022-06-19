import 'package:classtek/Models/marks.dart';
import 'package:dio/dio.dart';

class MarksRepo {
  static Future<List<MarksMessage>> getAllNews(
      String studentId, String sem) async {
    try {
      var response = await Dio().get(
        'https://schoolsystemmanagement-production-9724.up.railway.app/marks/ofStudent=$studentId/InSemester=$sem',
      );
      var marks = Marks.fromJson(response.data);
      if (marks.success! && marks.message!.isNotEmpty) return marks.message!;
    } catch (e) {
      print(e);
    }

    return [];
  }
}
