import 'package:classtek/Models/group.dart';

class GroupOfTeacher {
  bool? success;
  List<TGroup>? message;

  GroupOfTeacher({this.success, this.message});

  GroupOfTeacher.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['message'] != null) {
      message = [];
      json['message'].forEach((v) {
        message!.add(TGroup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (message != null) {
      data['message'] = message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TGroup {
  int? id;
  String? name;
  int? sectionId;
  String? inSection;
  String? inLevel;

  TGroup({this.id, this.name, this.sectionId, this.inSection, this.inLevel});

  TGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sectionId = json['section_Id'];
    inSection = json['inSection'];
    inLevel = json['inLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['section_Id'] = sectionId;
    data['inSection'] = inSection;
    data['inLevel'] = inLevel;
    return data;
  }
}
