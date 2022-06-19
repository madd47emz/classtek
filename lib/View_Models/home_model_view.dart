import 'package:classtek/Models/groupSchedule.dart';
import 'package:classtek/Models/student.dart';
import 'package:classtek/Models/teacher.dart';
import 'package:classtek/Models/teacherSchedule.dart';
import 'package:classtek/repository/scheduleRepo.dart';

import '../Models/news.dart';
import '../repository/newsRepo.dart';

class HomeModelView {
  SMessage? student;
  TMessage? teacher;
  final _today = DateTime(2022, 6, 12).weekday;

  HomeModelView(this.student, this.teacher);

  Future<List<NMessage>> getAllGroupNews() async {
    List<NMessage> list = await NewsRepo.getAllNews(student!.group!.id!);
    return list;
  }

  Future<List<GSession>> getTodayGroupSession() async {
    GroupSchMessage? schedule =
        await ScheduleRepo.getGroupSchedule(student!.group!.id!);
    if (schedule != null) {
      switch (_today) {
        case 7:
          return schedule.sunday!;
        case 1:
          return schedule.monday!;
        case 2:
          return schedule.tuesday!;
        case 3:
          return schedule.wednesday!;
        case 4:
          return schedule.thursday!;
      }
    }
    return [];
  }

  Future<List<TSession>> getTodayTeacherSession() async {
    TeacherSchMessage? schedule =
        await ScheduleRepo.getTeacherSchedule(teacher!.id!);
    if (schedule != null) {
      switch (_today) {
        case 7:
          return schedule.sunday!;
        case 1:
          return schedule.monday!;
        case 2:
          return schedule.tuesday!;
        case 3:
          return schedule.wednesday!;
        case 4:
          return schedule.thursday!;
      }
    }
    return [];
  }
}
