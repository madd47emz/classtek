import 'package:classtek/Views/userChoose.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    Timer(
        const Duration(seconds: 4),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserChose()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        color: Color(0xFF007AFF),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage('assets/Logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ]),
    ));
  }
}
