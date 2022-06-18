import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'modulCard.dart';
import 'chapterCard.dart';

class Chapter extends StatefulWidget {
  final bool type;
  const Chapter(this.type, {Key? key}) : super(key: key);

  @override
  State<Chapter> createState() => _ChapterState(type);
}

class _ChapterState extends State<Chapter> {
  final bool type;
  _ChapterState(this.type);
  final List<Module> mList = [
    const Module("Module 1"),
    const Module("Module 1"),
    const Module("Module 1"),
    const Module("Module 1"),
    const Module("Module 1"),
    const Module("Module 1"),
    const Module("Module 1"),
    const Module("Module 1"),
    const Module("Module 1"),
    const Module("Module 1"),
  ];
  final chList = [
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
    const ChapterCard("Chapter 1", null),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text("Chapter management",
            style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
        leading: Container(
          height: 45,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/Logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 0, 20),
              child: Text(
                "Modules",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 66,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                // ListView.separated(
                //   separatorBuilder: (context, idx) => const Divider(),
                itemBuilder: (context, idx) {
                  return mList[idx];
                },
                scrollDirection: Axis.horizontal,
                itemCount: mList.length,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Chapters",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700)),
                            type
                                ? GestureDetector(
                                    child: Container(
                                      height: 26,
                                      width: 106,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x3282B833),
                                              blurRadius: 8,
                                              spreadRadius: 3,
                                              offset: Offset(0,
                                                  4), // changes position of shadow
                                            ),
                                          ]),
                                      child: const Center(
                                        child: Text("ADD CHAPTER",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ),
                                  )
                                : Container(
                                    color: Colors.white,
                                    height: 26,
                                    width: 106,
                                  )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            // ListView.separated(
                            //   separatorBuilder: (context, idx) => const Divider(),
                            itemBuilder: (context, idx) {
                              return chList[idx];
                            },
                            scrollDirection: Axis.vertical,
                            itemCount: chList.length,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
