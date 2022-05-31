import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Cell extends StatelessWidget {
  final String title;
  final String room;
  final int group;
  final String time;
  const Cell(this.title, this.room, this.group, this.time, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 5,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(time,
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: double.infinity,
            width: 2,
            color: const Color(0xE5E5E5B2),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
              Text("group$group",
                  style: const TextStyle(
                      color: primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: double.infinity,
            width: 2,
            color: const Color(0xE5E5E5B2),
          ),
          Text(room,
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
