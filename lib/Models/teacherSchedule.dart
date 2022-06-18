import 'package:classtek/Models/Module.dart';
import 'package:classtek/Models/group.dart';
import 'package:classtek/Models/sale.dart';

class TeacherSchedule {
  bool? success;
  TeacherSchMessage? message;

  TeacherSchedule({this.success, this.message});

  TeacherSchedule.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'] != null
        ? TeacherSchMessage.fromJson(json['message'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;

    message!.toJson();

    return data;
  }
}

class TeacherSchMessage {
  List<TSession>? sunday;
  List<TSession>? monday;
  List<TSession>? tuesday;
  List<TSession>? wednesday;
  List<TSession>? thursday;

  TeacherSchMessage(
      {this.sunday, this.monday, this.tuesday, this.wednesday, this.thursday});

  TeacherSchMessage.fromJson(Map<String, dynamic> json) {
    if (json['sunday'] != null) {
      sunday = <TSession>[];
      json['sunday'].forEach((v) {
        sunday!.add(TSession.fromJson(v));
      });
    }
    if (json['monday'] != null) {
      monday = <TSession>[];
      json['monday'].forEach((v) {
        monday!.add(TSession.fromJson(v));
      });
    }
    if (json['tuesday'] != null) {
      tuesday = <TSession>[];
      json['tuesday'].forEach((v) {
        tuesday!.add(TSession.fromJson(v));
      });
    }
    if (json['wednesday'] != null) {
      wednesday = <TSession>[];
      json['wednesday'].forEach((v) {
        wednesday!.add(TSession.fromJson(v));
      });
    }
    if (json['thursday'] != null) {
      thursday = <TSession>[];
      json['thursday'].forEach((v) {
        thursday!.add(TSession.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sunday'] = sunday!.map((v) => v.toJson()).toList();
    data['monday'] = monday!.map((v) => v.toJson()).toList();
    data['tuesday'] = tuesday!.map((v) => v.toJson()).toList();
    data['wednesday'] = wednesday!.map((v) => v.toJson()).toList();
    data['thursday'] = thursday!.map((v) => v.toJson()).toList();
    return data;
  }
}

class TSession {
  int? semester;
  String? lessonType;
  String? startingTime;
  Group? group;
  Module? module;
  Sale? sale;

  TSession(
      {this.semester,
      this.lessonType,
      this.startingTime,
      this.group,
      this.module,
      this.sale});

  TSession.fromJson(Map<String, dynamic> json) {
    semester = json['semester'];
    lessonType = json['lesson_Type'];
    startingTime = json['startingTime'];
    group = json['group'] != null ? Group.fromJson(json['group']) : null;
    module = json['module'] != null ? Module.fromJson(json['module']) : null;
    sale = json['sale'] != null ? Sale.fromJson(json['sale']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['semester'] = semester;
    data['lesson_Type'] = lessonType;
    data['startingTime'] = startingTime;
    data['group'] = group!.toJson();

    data['module'] = module!.toJson();

    data['sale'] = sale!.toJson();
    return data;
  }
}
