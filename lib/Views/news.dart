import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'groupCard.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  final List<Group> gList = [
    Group(1),
    Group(2),
    Group(3),
    Group(4),
    Group(5),
    Group(6),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          Navigator.pop(context);
        }),
        backgroundColor: primaryColor,
        elevation: 20,
        child: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text("Send news",
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
        color: Colors.white,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 6),
            child: Text(
              "Select groups",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
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
                return gList[idx];
              },
              scrollDirection: Axis.horizontal,
              itemCount: gList.length,
            ),
          ),
          Container(
            height: 2,
            color: const Color(0xFFe5e5e5),
            margin: const EdgeInsets.fromLTRB(42, 30, 42, 0),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Content",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                  GestureDetector(
                    child: Container(
                      height: 26,
                      width: 106,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3282B833),
                              blurRadius: 8,
                              spreadRadius: 3,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ]),
                      child: const Center(
                        child: Text("ATTACH FILE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              onChanged: (object) => null,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.3), width: 1),
                    borderRadius: BorderRadius.circular(10)),
                hintText: " Object...",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              keyboardType: TextInputType.text,
              cursorColor: primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              maxLines: 10,
              onChanged: (message) => null,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.3), width: 1),
                    borderRadius: BorderRadius.circular(10)),
                hintText: "Message ...",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              keyboardType: TextInputType.text,
              cursorColor: primaryColor,
            ),
          ),
        ]),
      ),
    );
  }
}
