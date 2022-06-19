import 'package:classtek/Models/news.dart';
import 'package:classtek/Models/teacherSchedule.dart';
import 'package:classtek/View_Models/home_model_view.dart';
import 'package:classtek/Views/newsCard.dart';
import 'package:classtek/Views/profile.dart';
import 'package:classtek/Views/see_allCell.dart';
import 'package:flutter/material.dart';
import '../Models/groupSchedule.dart';
import '../Models/teacher.dart';
import '../constants/colors.dart';
import 'schedulCell.dart';

class Home extends StatefulWidget {
  final bool type;
  final HomeModelView model;

  const Home(this.type, this.model, {Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState(type, model);
}

class _HomeState extends State<Home> {
  final HomeModelView hModel;
  bool canSeeAll = false;

  final bool type;
  _HomeState(this.type, this.hModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                "Welcome ${type ? hModel.teacher!.name : hModel.student!.name}!",
                style: const TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            Container(
              height: 36,
              width: 36,
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
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile(type, hModel)));
                    //type, hModel
                  },
                  icon: const Icon(Icons.person, color: primaryColor)),
            )
          ],
        ),
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
              padding: EdgeInsets.fromLTRB(30, 20, 0, 10),
              child: Text(
                "News",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
                height: 66,
                width: MediaQuery.of(context).size.width,
                child: type
                    ? NewsCard(NMessage(
                        fileUrl: "hi",
                        object: "No News yet",
                        message:
                            "It may be out of connection or There are no news",
                        sender: TMessage(name: "Classtek", lastName: "App")))
                    : FutureBuilder<List<NMessage>>(
                        future: hModel.getAllGroupNews(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            );
                          } else {
                            var news = snapshot.data!;
                            return ListView.builder(
                              itemBuilder: (context, idx) {
                                return NewsCard(news[idx]);
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: news.length,
                            );
                          }
                        })),
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
                            Text("Today's schedule",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700)),
                            GestureDetector(
                              onTap: (() => setState(() {
                                    if (canSeeAll) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Schedule(type, hModel)));
                                    }
                                  })),
                              child: Text("See all",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: type
                                ? FutureBuilder<List<TSession>>(
                                    future: hModel.getTodayTeacherSession(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(
                                              color: primaryColor),
                                        );
                                      } else {
                                        var today = snapshot.data!;

                                        if (today.isNotEmpty) {
                                          canSeeAll = true;
                                          return ListView.builder(
                                            itemBuilder: (context, idx) {
                                              return Cell(
                                                  today[idx].module!.shortName!,
                                                  today[idx].sale!.name!,
                                                  today[idx].group!.name!,
                                                  today[idx]
                                                      .startingTime!
                                                      .substring(0, 5));
                                            },
                                            scrollDirection: Axis.vertical,
                                            itemCount: today.length,
                                          );
                                        }
                                        return Center(
                                          child: Text("No Session Today",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.9),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700)),
                                        );
                                      }
                                    })
                                : FutureBuilder<List<GSession>>(
                                    future: hModel.getTodayGroupSession(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(
                                              color: primaryColor),
                                        );
                                      } else {
                                        var today = snapshot.data!;

                                        if (today.isNotEmpty) {
                                          canSeeAll = true;
                                          return ListView.builder(
                                            itemBuilder: (context, idx) {
                                              return Cell(
                                                  today[idx].module!.shortName!,
                                                  today[idx].sale!.name!,
                                                  today[idx].teacher!.name! +
                                                      today[idx]
                                                          .teacher!
                                                          .lastName!
                                                          .substring(0, 1),
                                                  today[idx]
                                                      .startingTime!
                                                      .substring(0, 5));
                                            },
                                            scrollDirection: Axis.vertical,
                                            itemCount: today.length,
                                          );
                                        }
                                        return Center(
                                          child: Text("No Session Today",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.9),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700)),
                                        );
                                      }
                                    })),
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
