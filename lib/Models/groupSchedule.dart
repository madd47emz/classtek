import 'package:classtek/Models/Module.dart';
import 'package:classtek/Models/sale.dart';
import 'package:classtek/Models/teacher.dart';

class GroupSchedule {
  bool? success;
  GroupSchMessage? message;

  GroupSchedule({this.success, this.message});

  GroupSchedule.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'] != null
        ? GroupSchMessage.fromJson(json['message'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;

    message!.toJson();

    return data;
  }
}

class GroupSchMessage {
  List<GSession>? sunday;
  List<GSession>? monday;
  List<GSession>? tuesday;
  List<GSession>? wednesday;
  List<GSession>? thursday;

  GroupSchMessage(
      {this.sunday, this.monday, this.tuesday, this.wednesday, this.thursday});

  GroupSchMessage.fromJson(Map<String, dynamic> json) {
    if (json['sunday'] != null) {
      sunday = <GSession>[];
      json['sunday'].forEach((v) {
        sunday!.add(GSession.fromJson(v));
      });
    }
    if (json['monday'] != null) {
      monday = <GSession>[];
      json['monday'].forEach((v) {
        monday!.add(GSession.fromJson(v));
      });
    }
    if (json['tuesday'] != null) {
      tuesday = <GSession>[];
      json['tuesday'].forEach((v) {
        tuesday!.add(GSession.fromJson(v));
      });
    }
    if (json['wednesday'] != null) {
      wednesday = <GSession>[];
      json['wednesday'].forEach((v) {
        wednesday!.add(GSession.fromJson(v));
      });
    }
    if (json['thursday'] != null) {
      thursday = <GSession>[];
      json['thursday'].forEach((v) {
        thursday!.add(GSession.fromJson(v));
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

class GSession {
  int? semester;
  String? lessonType;
  String? startingTime;
  TMessage? teacher;
  Module? module;
  Sale? sale;

  GSession(
      {this.semester,
      this.lessonType,
      this.startingTime,
      this.teacher,
      this.module,
      this.sale});

  GSession.fromJson(Map<String, dynamic> json) {
    semester = json['semester'];
    lessonType = json['lesson_Type'];
    startingTime = json['startingTime'];
    teacher =
        json['teacher'] != null ? TMessage.fromJson(json['teacher']) : null;
    module = json['module'] != null ? Module.fromJson(json['module']) : null;
    sale = json['sale'] != null ? Sale.fromJson(json['sale']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['semester'] = semester;
    data['lesson_Type'] = lessonType;
    data['startingTime'] = startingTime;
    data['teacher'] = teacher!.toJson();

    data['module'] = module!.toJson();

    data['sale'] = sale!.toJson();
    return data;
  }
}
