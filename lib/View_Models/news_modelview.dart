import 'package:classtek/Models/news.dart';
import 'package:classtek/Views/groupCard.dart';
import 'package:classtek/repository/newsRepo.dart';

import '../Models/groupTeacher.dart';

class NewsModelView {
  List<String> selectedNewsGroup(List<GroupCard> glist) {
    List<String> list = [];
    for (int i = 0; i < glist.length; i++) {
      if (glist[i].state.isTapped()) {
        list.add(glist[i].state.id);
      }
    }
    return list;
  }

  Future<List<TGroup>> showConcernedGroup(String teacherId) async {
    var list = await NewsRepo.getGroup(teacherId);
    return list;
  }

  Future<String> postNewsToGroups(
      String id, NMessage body, List<String> groups) async {
    bool response = await NewsRepo.postNews(body, id, groups);
    if (response) {
      return "Sent to the According group(s)...";
    }
    return "Something went wrong!";
  }
}
