import 'package:classtek/Models/student.dart';
import 'package:classtek/repository/loginRepo.dart';

import '../Models/teacher.dart';

class LoginModelView {
  String email;
  String password;
  late bool status;

  LoginModelView({required this.email, required this.password});

  Future<SMessage> studentLogin() async {
    var student = await LoginApi.studentLogin(email, password);
    if (student == null) {
      status = false;
    } else {
      status = true;
      return student;
    }
    return SMessage();
  }

  Future<TMessage> teacherLogin() async {
    var teacher = await LoginApi.teacherLogin(email, password);
    if (teacher == null) {
      status = false;
    } else {
      status = true;
      return teacher;
    }
    return TMessage();
  }
}
