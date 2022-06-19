import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Cell extends StatelessWidget {
  final String module;
  final String room;
  final String groupOrTeacher;
  final String time;
  const Cell(this.module, this.room, this.groupOrTeacher, this.time, {Key? key})
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
              blurRadius: 10,
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
              Text(module,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
              Text(groupOrTeacher,
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
