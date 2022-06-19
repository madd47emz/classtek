import 'package:classtek/View_Models/home_model_view.dart';
import 'package:classtek/Views/chapter.dart';
import 'package:classtek/Views/home.dart';
import 'package:classtek/Views/news.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Dash extends StatefulWidget {
  final HomeModelView homeModelView;
  final bool type;
  const Dash(this.type, this.homeModelView, {Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState(type, homeModelView);
}

class _DashState extends State<Dash> {
  bool type;
  HomeModelView homeModelView;
  _DashState(this.type, this.homeModelView);
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: type
          ? FloatingActionButton(
              onPressed: () => setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            News(homeModelView.teacher!.id!)));
              }),
              backgroundColor: primaryColor,
              elevation: 20,
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: IndexedStack(
        index: current,
        children: [
          Home(type, homeModelView),
          type
              ? Chapter(type, homeModelView.teacher!.id!)
              : Chapter(type, homeModelView.student!.id!),
          const Scaffold(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: current,
          onTap: (idx) => setState(() {
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
            BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app), label: "logout"),
          ]),
    );
  }
}
