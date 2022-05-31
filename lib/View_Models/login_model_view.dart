class LoginModelView {
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Email cannot be empty";
    }

    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return ("Please enter a valid email");
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Password cannot be empty";
    }

    if (value.length < 8) {
      return ("please enter valid password min. 8 character");
    } else {
      return null;
    }
  }

  void SignIn(String email, String password) async {}
}
