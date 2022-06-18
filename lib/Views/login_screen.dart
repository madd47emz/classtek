import 'package:classtek/View_Models/home_model_view.dart';
import 'package:classtek/View_Models/login_model_view.dart';
import 'package:classtek/constants/colors.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class Login extends StatefulWidget {
  final String type;
  const Login(this.type, {Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState(type);
}

class _LoginState extends State<Login> {
  String type;
  _LoginState(this.type);
  LoginModelView modelView = LoginModelView(email: "", password: "");
  var email;
  var password;
  final textFieldColor = const Color(0x333282B8);
  final mainColor = const Color(0xFF007AFF);
  static const double verticalMargin = 20;
  final margin = const EdgeInsets.fromLTRB(20, 0, 20, 20);
  final double r = 20;
  var _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: <Widget>[
              Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Form(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              key: _formKey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/login.png',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: verticalMargin),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('Logo.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Sign in now & start learning',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        color: Color(0xFF007AFF),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: margin,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: TextFormField(
                                          onChanged: (name) => {email = name},
                                          style: const TextStyle(
                                              color: Color(0xFF0F4C75),
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                            prefixIcon: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.email)),
                                            filled: true,
                                            fillColor: textFieldColor,
                                            enabled: true,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: textFieldColor),
                                                borderRadius:
                                                    BorderRadius.circular(r)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: textFieldColor),
                                                borderRadius:
                                                    BorderRadius.circular(r)),
                                            hintText: "E-mail",
                                            hintStyle: const TextStyle(
                                              color: Color(0xB20F4C75),
                                            ),
                                          ),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            if (email!.isEmpty) {
                                              return "Email cannot be empty";
                                            }
                                            if (!RegExp(
                                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                                .hasMatch(email)) {
                                              return ("Please enter a valid email");
                                            } else {
                                              return null;
                                            }
                                          },
                                          cursorColor: const Color(0xFF0F4C75)),
                                    ),
                                    Container(
                                      margin: margin,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: TextFormField(
                                          onChanged: (p) => {password = p},
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Password cannot be empty";
                                            }

                                            if (value.length < 4) {
                                              return ("please enter valid password min. 8 character");
                                            } else {
                                              return null;
                                            }
                                          },
                                          style: const TextStyle(
                                              color: Color(0xFF0F4C75),
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.start,
                                          obscureText: _isObscure,
                                          decoration: InputDecoration(
                                            prefixIcon: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.lock_outline)),
                                            suffixIcon: IconButton(
                                                icon: Icon(_isObscure
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                                onPressed: () {
                                                  setState(() {
                                                    _isObscure = !_isObscure;
                                                  });
                                                }),
                                            filled: true,
                                            fillColor: textFieldColor,
                                            enabled: true,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: textFieldColor),
                                                borderRadius:
                                                    BorderRadius.circular(r)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: textFieldColor),
                                                borderRadius:
                                                    BorderRadius.circular(r)),
                                            hintText: "Password",
                                            hintStyle: const TextStyle(
                                              color: Color(0xB20F4C75),
                                            ),
                                          ),
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          // validator:
                                          cursorColor: const Color(0xFF0F4C75)),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        if (_formKey.currentState!.validate()) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => const Center(
                                              child: CircularProgressIndicator(
                                                  backgroundColor: Colors.white,
                                                  color: primaryColor),
                                            ),
                                          );
                                          modelView.email = email;
                                          modelView.password = password;
                                          if (type == "student") {
                                            var student =
                                                await modelView.studentLogin();
                                            if (modelView.status) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Dash(
                                                              false,
                                                              HomeModelView(
                                                                  student,
                                                                  null))));
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        title: const Center(
                                                          child: Text(
                                                            "Trouble",
                                                            style: TextStyle(
                                                                color:
                                                                    primaryColor),
                                                          ),
                                                        ),
                                                        content: const Text(
                                                            "Incorrect email or password"),
                                                        actions: [
                                                          RaisedButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              color:
                                                                  primaryColor,
                                                              child: const Text(
                                                                  'try again',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)))
                                                        ],
                                                      ));
                                            }
                                          }
                                          if (type == "teacher") {
                                            var teacher =
                                                await modelView.teacherLogin();
                                            if (modelView.status) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Dash(
                                                              true,
                                                              HomeModelView(
                                                                  null,
                                                                  teacher))));
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        title: const Text(
                                                          "Trouble",
                                                          style: TextStyle(
                                                              color:
                                                                  primaryColor),
                                                        ),
                                                        content: const Text(
                                                            "Incorrect email or password"),
                                                        actions: [
                                                          RaisedButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              color:
                                                                  primaryColor)
                                                        ],
                                                      ));
                                            }
                                          }
                                        }
                                      },
                                      child: Container(
                                        margin: margin,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.09,
                                        decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                offset: Offset(4, 3),
                                                blurRadius: 5,
                                                color: Color(0xFF3282B8),
                                              )
                                            ],
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(r)),
                                        child: const Center(
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                        child: const Text(
                                      'Forget password ?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        decoration: TextDecoration.none,
                                        color: Color(0xFF007AFF),
                                      ),
                                    )) //forgetPw
                                  ])))))
            ])));
  }
}
