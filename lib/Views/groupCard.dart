import '../constants/colors.dart';
import 'package:flutter/material.dart';

class Group extends StatefulWidget {
  int num;
  _GroupState state = _GroupState();
  Group(this.num, {Key? key}) : super(key: key);

  @override
  State<Group> createState() => state;
}

class _GroupState extends State<Group> {
  bool tapped = false;
  bool isTapped() => tapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tapped = !tapped;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        width: 70,
        decoration: BoxDecoration(
            color: tapped ? Colors.white : primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.group,
              color: tapped ? primaryColor : Colors.white,
              size: 30,
            ),
            Text("Group 1",
                style: TextStyle(
                    color: tapped ? primaryColor : Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
