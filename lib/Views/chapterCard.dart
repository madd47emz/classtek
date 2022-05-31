import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ChapterCard extends StatefulWidget {
  final String title;
  final content; //TODO:sessions & files
  const ChapterCard(this.title, this.content, {Key? key}) : super(key: key);

  @override
  State<ChapterCard> createState() => _ChapterCardState(title, content);
}

class _ChapterCardState extends State<ChapterCard> {
  final String title;
  final content;
  final List<Widget> etList = [
    //first tile of adding session
    ExpansionTile(
      leading: const Icon(
        Icons.circle,
        color: primaryColor,
        size: 18,
      ),
      title: TextField(
        onChanged: (session) {},
        style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.w600,
            fontSize: 12),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Set session",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        keyboardType: TextInputType.text,
        cursorColor: primaryColor,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      trailing: IconButton(
        onPressed: (() {}),
        iconSize: 15,
        icon: Icon(
          Icons.download,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    ), //first tile of adding session
    ExpansionTile(
        leading: const Icon(
          Icons.circle,
          size: 18,
          color: primaryColor,
        ),
        title: Text("Cour",
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 12,
                fontWeight: FontWeight.w600)),
        controlAffinity: ListTileControlAffinity.leading,
        children: <Widget>[
          ListTile(
            title: const Text("final,pdf",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 10,
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
        title: Text("Cour",
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 12,
                fontWeight: FontWeight.w600)),
        controlAffinity: ListTileControlAffinity.leading,
        children: <Widget>[
          ListTile(
            title: const Text("final,pdf",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 10,
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
        title: Text("Cour",
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 12,
                fontWeight: FontWeight.w600)),
        controlAffinity: ListTileControlAffinity.leading,
        children: <Widget>[
          ListTile(
            title: const Text("final,pdf",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w400)),
            onTap: () {},
          )
        ]),
  ];
  _ChapterCardState(this.title, this.content);
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
              blurRadius: 5,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 11),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(title,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w700)),
            IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.add,
                  color: primaryColor,
                  size: 18,
                )),
          ]),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              // ListView.separated(
              //   separatorBuilder: (context, idx) => const Divider(),
              itemBuilder: (context, idx) {
                return etList[idx];
              },
              scrollDirection: Axis.vertical,
              itemCount: etList.length,
            ),
          ),
        ),
      ]),
    );
  }
}
