import '../constants/colors.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatefulWidget {
  GroupCardState state;
  GroupCard(this.state, {Key? key}) : super(key: key);

  @override
  State<GroupCard> createState() => state;
}

class GroupCardState extends State<GroupCard> {
  String name;
  String id;
  GroupCardState(this.name, this.id);
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
            Text(name,
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
