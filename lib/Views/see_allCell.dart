import 'package:classtek/View_Models/home_model_view.dart';
import 'package:classtek/Views/schedulCell.dart';
import 'package:flutter/material.dart';
import '../Models/groupSchedule.dart';
import '../Models/teacherSchedule.dart';
import '../constants/colors.dart';

class Schedule extends StatefulWidget {
  HomeModelView hModel;
  bool type;
  Schedule(this.type, this.hModel, {Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _NewsState(type, hModel);
}

class _NewsState extends State<Schedule> {
  HomeModelView hModel;
  bool type;
  _NewsState(this.type, this.hModel);
  @override
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        color: Colors.white,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Today's schedule",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
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
                              return ListView.builder(
                                itemBuilder: (context, idx) {
                                  return Cell(
                                      today[idx].module!.shortName!,
                                      today[idx].sale!.name!,
                                      today[idx].group!.name!,
                                      today[idx].startingTime!.substring(0, 4));
                                },
                                scrollDirection: Axis.vertical,
                                itemCount: today.length,
                              );
                            }
                            return Container();
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
                                      today[idx].startingTime!.substring(0, 5));
                                },
                                scrollDirection: Axis.vertical,
                                itemCount: today.length,
                              );
                            }
                            return Container();
                          }
                        })),
          ),
        ]),
      ),
    );
  }
}
