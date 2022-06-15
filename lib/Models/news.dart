// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

import 'package:classtek/Models/teacher.dart';

class NewsOfGroup {
  int? newsId;
  int? groupId;
  String? object;
  String? message;
  Uri? fileUrl;
  Teacher? sender;

  NewsOfGroup(
      {required this.newsId,
      required this.groupId,
      required this.object,
      this.message,
      this.fileUrl,
      required this.sender});

  NewsOfGroup.fromJson(Map<String, dynamic> json) {
    newsId = json['newsId'];
    groupId = json['group_Id'];
    object = json['object'];
    message = json['message'];
    fileUrl = json['fileUrl'];
    sender = Teacher.fromJson(json['sender']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newsId'] = newsId;
    data['group_Id'] = groupId;
    data['object'] = object;
    data['message'] = message;
    data['fileUrl'] = fileUrl;
    data['sender'] = sender!.toJson();

    return data;
  }
}
