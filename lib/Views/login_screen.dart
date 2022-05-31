import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final textFieldColor = const Color(0x333282B8);
  final mainColor = const Color(0xFF007AFF);
  static const double verticalMargin = 20;
  final margin = const EdgeInsets.fromLTRB(20, 0, 20, 20);
  final double r = 20;
  var _isObscure = true;
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
                              key: GlobalKey<FormState>(),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/illustration.jpeg',
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
                                          onChanged: (name) => {},
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
                                          // validator:
                                          cursorColor: const Color(0xFF0F4C75)),
                                    ),
                                    Container(
                                      margin: margin,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      child: TextFormField(
                                          onChanged: (name) => {},
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
