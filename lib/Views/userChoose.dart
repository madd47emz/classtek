import 'package:classtek/Views/login_screen.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class UserChose extends StatelessWidget {
  UserChose({Key? key}) : super(key: key);
  final ctrl = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: ctrl,
        children: const [Page('student'), Page('teacher')],
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String type;
  const Page(this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login(type)));
      },
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('$type.jpg',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
                fit: BoxFit.cover),
            const SizedBox(
              height: 20,
            ),
            Text(type,
                style: const TextStyle(
                    color: primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}
