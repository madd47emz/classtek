import 'package:classtek/Models/marks.dart';
import 'package:classtek/repository/marksRepo.dart';

class MarksModelView {
  String studentId;
  int sem = 1;
  MarksModelView({required this.studentId});
  Future<List<MarksMessage>> getAllStudentMarks() async {
    List<MarksMessage> list1 =
        await MarksRepo.getAllNews(studentId, sem.toString());
    // if (DateTime.now().isAfter(DateTime(DateTime.now().year, 2, 15))) {
    //   sem = 2;
    // list1 +=
    //    await MarksRepo.getAllNews(studentId, sem.toString());

    // }

    return list1;
  }
}
