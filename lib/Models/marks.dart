import 'package:classtek/Models/Module.dart';

class Marks {
  bool? success;
  List<MarksMessage>? message;

  Marks({this.success, this.message});

  Marks.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['message'] != null) {
      message = [];
      json['message'].forEach((v) {
        message!.add(MarksMessage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (message != null) {
      data['message'] = message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MarksMessage {
  int? id;
  int? semester;
  int? emd1;
  int? emd2;
  int? cc;
  Module? module;
  double? avg;

  MarksMessage(
      {this.id,
      this.semester,
      this.emd1,
      this.emd2,
      this.cc,
      this.module,
      this.avg});

  MarksMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    semester = json['semester'];
    emd1 = json['emd1'];
    emd2 = json['emd2'];
    cc = json['cc'];
    module = json['module'] != null ? Module.fromJson(json['module']) : null;
    avg = json['avg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['semester'] = semester;
    data['emd1'] = emd1;
    data['emd2'] = emd2;
    data['cc'] = cc;
    if (module != null) {
      data['module'] = module!.toJson();
    }
    data['avg'] = avg;
    return data;
  }
}
