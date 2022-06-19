import 'package:classtek/Views/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  // NewsRepo.postNews(
  //     NMessage(
  //         fileUrl: null,
  //         object: 'session td',
  //         message: 'w have it 12 mars',
  //         sender: TMessage(
  //             id: '1',
  //             name: 'bensaber',
  //             lastName: 'bensaber',
  //             profileImage: null)),
  //     '1',
  //     ['1']);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SplashScreen());
  }
}


//youcefBnw@gmail.com
//teb.rami@gmail.com qwerty
//djamel.besaber@esi-sba.dz 12345; 