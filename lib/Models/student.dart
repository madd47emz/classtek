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
  String? email;
  Uri? profileImage;
  // Group group;
  // Section section;
  // Null speciality;
  // Batch batch;

  SMessage({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.profileImage,
  });

  // this.group,
  // this.section,
  // this.speciality,
  // this.batch});

  SMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    email = json['email'];
    profileImage = json['profileImage'];
    // group = json['group'] != null ? Group.fromJson(json['group']) : null;
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
    data['email'] = email;
    data['profileImage'] = profileImage;
    // if (this.group != null) {
    //   data['group'] = this.group.toJson();
    // }
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
