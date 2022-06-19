import 'package:classtek/Models/student.dart';
import 'package:classtek/Models/teacher.dart';
import 'package:dio/dio.dart';

class LoginApi {
  static Future<SMessage?> studentLogin(String email, String password) async {
    try {
      var response = await Dio().post(
          'https://schoolsystemmanagement-production-9724.up.railway.app/student/login',
          data: {'email': email, 'password': password});
      Student student = Student.fromJson(response.data);
      if (student.success!) return student.message;
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<TMessage?> teacherLogin(String email, String password) async {
    try {
      var response = await Dio().post(
          'https://schoolsystemmanagement-production-9724.up.railway.app/teacher/login',
          data: {'email': email, 'password': password});

      Teacher teacher = Teacher.fromJson(response.data);
      if (teacher.success!) return teacher.message;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
