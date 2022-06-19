// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'package:classtek/Models/teacher.dart';

class NewsOfGroup {
  bool? success;
  List<NMessage>? message;

  NewsOfGroup({this.success, this.message});

  NewsOfGroup.fromJson(Map<String, dynamic> json) {
    success = json['success'];

    message = <NMessage>[];
    json['message'].forEach((v) {
      message!.add(NMessage.fromJson(v));
    });
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

class NMessage {
  String? object;
  String? message;
  String? fileUrl;
  TMessage? sender;

  NMessage({this.object, this.message, this.fileUrl, this.sender});

  NMessage.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    message = json['message'];
    fileUrl = json['fileUrl'];
    sender = TMessage.fromJson(json['sender']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['object'] = object;
    data['message'] = message;
    data['fileUrl'] = fileUrl;
    data['sender'] = sender!.toJson();

    return data;
  }
}
