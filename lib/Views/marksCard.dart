import 'package:classtek/Models/marks.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MarksCard extends StatefulWidget {
  MarksMessage info;
  MarksCard(this.info, {Key? key}) : super(key: key);

  @override
  State<MarksCard> createState() => MarksCardState(info);
}

class MarksCardState extends State<MarksCard> {
  MarksMessage marks;
  MarksCardState(this.marks);
  List<Widget> setMarks() {
    return [
      ExpansionTile(
          leading: const Icon(
            Icons.circle,
            size: 18,
            color: primaryColor,
          ),
          title: Text("Exam1",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 12,
                  fontWeight: FontWeight.w600)),
          controlAffinity: ListTileControlAffinity.leading,
          children: <Widget>[
            ListTile(
              title: Text('${marks.emd1}',
                  style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
              onTap: () {},
            )
          ]),
      ExpansionTile(
          leading: const Icon(
            Icons.circle,
            size: 18,
            color: primaryColor,
          ),
          title: Text("Exam2",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 12,
                  fontWeight: FontWeight.w600)),
          controlAffinity: ListTileControlAffinity.leading,
          children: <Widget>[
            ListTile(
              title: Text('${marks.emd2}',
                  style: const TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
              onTap: () {},
            )
          ]),
      ExpansionTile(
          leading: const Icon(
            Icons.circle,
            size: 18,
            color: primaryColor,
          ),
          title: Text("CC",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 12,
                  fontWeight: FontWeight.w600)),
          controlAffinity: ListTileControlAffinity.leading,
          children: <Widget>[
            ListTile(
              title: Text('${marks.cc}',
                  style: const TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
              onTap: () {},
            )
          ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 200,
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 11),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('${marks.module!.coef}',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            Text(marks.module!.shortName!,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            Text('AVG:${marks.avg!}',
                style: const TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ]),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              // ListView.separated(
              //   separatorBuilder: (context, idx) => const Divider(),
              itemBuilder: (context, idx) {
                return setMarks()[idx];
              },
              scrollDirection: Axis.vertical,
              itemCount: setMarks().length,
            ),
          ),
        ),
      ]),
    );
  }
}
