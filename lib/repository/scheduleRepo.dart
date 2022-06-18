import 'package:classtek/Models/groupSchedule.dart';
import 'package:classtek/Models/teacherSchedule.dart';
import 'package:dio/dio.dart';

class ScheduleRepo {
  static Future<GroupSchMessage?> getGroupSchedule(String groupId) async {
    try {
      var response = await Dio().get(
        'https://schoolsystemmanagement-production-9724.up.railway.app/lessons/ofGroup/$groupId',
      );
      var schedule = GroupSchedule.fromJson(response.data);
      if (schedule.success!) return schedule.message!;
    } catch (e) {
      print(e);
    }

    return null;
  }

  static Future<TeacherSchMessage?> getTeacherSchedule(String teacherId) async {
    try {
      var response = await Dio().get(
        'https://schoolsystemmanagement-production-9724.up.railway.app/lessons/ofTeacher/$teacherId',
      );
      var schedule = TeacherSchedule.fromJson(response.data);
      if (schedule.success!) return schedule.message!;
    } catch (e) {
      print(e);
    }

    return null;
  }
}
