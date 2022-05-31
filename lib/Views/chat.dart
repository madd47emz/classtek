import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'onlineBubb.dart';
import 'chatBubb.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<Bub> bList = [
    const Bub("Admin"),
    const Bub("Admin"),
    const Bub("Admin"),
    const Bub("Admin"),
    const Bub("Admin"),
    const Bub("Admin"),
    const Bub("Admin"),
    const Bub("Admin"),
    const Bub("Admin"),
    const Bub("Admin"),
    const Bub("Admin"),
    const Bub("Admin"),
  ];
  final List<ChatBub> cbList = [
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
    const ChatBub("Admin", "hi there", "9:00"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text("Chat",
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
              "Who's online",
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
                return bList[idx];
              },
              scrollDirection: Axis.horizontal,
              itemCount: bList.length,
            ),
          ),
          Container(
            height: 2,
            color: const Color(0xFFe5e5e5),
            margin: const EdgeInsets.fromLTRB(42, 30, 42, 0),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                separatorBuilder: (context, idx) => const Divider(
                  thickness: 1,
                  color: Color(0xFFe5e5e5),
                ),
                itemBuilder: (context, idx) {
                  return cbList[idx];
                },
                scrollDirection: Axis.vertical,
                itemCount: cbList.length,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
