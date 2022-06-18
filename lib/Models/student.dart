import 'package:classtek/Models/group.dart';

class Student {
  bool? success;
  SMessage? message;

  Student({this.success, this.message});

  Student.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message =
        json['message'] != null ? SMessage.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class SMessage {
  String? id;
  String? name;
  String? lastName;
  Uri? profileImage;
  Group? group;
  // Section section;
  // Null speciality;
  // Batch batch;

  SMessage({this.id, this.name, this.lastName, this.profileImage, this.group});

  // this.group,
  // this.section,
  // this.speciality,
  // this.batch});

  SMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    profileImage = json['profileImage'];
    group = Group.fromJson(json['group']);
    // group = json['group'] != null ?  : null;
    // section =
    //     json['section'] != null ? Section.fromJson(json['section']) : null;
    // speciality = json['speciality'];
    // batch = json['batch'] != null ? Batch.fromJson(json['batch']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['lastName'] = lastName;
    data['profileImage'] = profileImage;

    data['group'] = group!.toJson();
    // if (this.section != null) {
    //   data['section'] = this.section.toJson();
    // }
    // data['speciality'] = this.speciality;
    // if (this.batch != null) {
    //   data['batch'] = this.batch.toJson();
    // }
    return data;
  }
}
