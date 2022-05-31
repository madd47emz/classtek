import 'package:classtek/Views/chapter.dart';
import 'package:classtek/Views/chat.dart';
import 'package:classtek/Views/home.dart';
import 'package:classtek/Views/news.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int current = 0;
  Icon float = const Icon(Icons.add);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const News()));
        }),
        backgroundColor: primaryColor,
        elevation: 20,
        child: float,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: IndexedStack(
        index: current,
        children: const [
          Home(),
          Chapter(),
          Chat(),
          Scaffold(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: current,
          onTap: (idx) => setState(() {
                float = const Icon(Icons.add);
                current = idx;
              }),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 20,
          iconSize: 20,
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.black.withOpacity(0.4),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: "chapter"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app), label: "logout"),
          ]),
    );
  }
}
