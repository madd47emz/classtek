class Teacher {
  bool? success;
  TMessage? message;

  Teacher({this.success, this.message});

  Teacher.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message =
        json['message'] != null ? TMessage.fromJson(json['message']) : null;
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

class TMessage {
  String? id;
  String? name;
  String? lastName;
  Uri? profileImage;

  TMessage({
    this.id,
    this.name,
    this.lastName,
    this.profileImage,
  });

  TMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['lastName'] = lastName;
    data['profileImage'] = profileImage;
    return data;
  }
}
