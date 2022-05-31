import '../constants/colors.dart';
import 'package:flutter/material.dart';

class Bub extends StatelessWidget {
  final String name;
  //TODO: final IMAGEURI icon;
  const Bub(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 65,
      width: 70,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //TODO: ImageIcon(size: 30,icon);
          const Icon(
            Icons.person,
            color: primaryColor,
            size: 30,
          ),
          Text(name,
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
