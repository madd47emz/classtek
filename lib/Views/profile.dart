import 'package:classtek/constants/colors.dart';
import 'package:flutter/material.dart';

import '../View_Models/home_model_view.dart';

class Profile extends StatelessWidget {
  bool type;
  HomeModelView hModel;

  Profile(this.type, this.hModel, {Key? key}) : super(key: key);
  List<Container> getStudentInfo() {
    return [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.7),
                blurRadius: 10,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ]),
        child: Center(
          child: Text("${hModel.student!.name!} ${hModel.student!.lastName!}",
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.7),
                blurRadius: 10,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ]),
        child: Center(
          child: Text("${hModel.student!.group!.name!}",
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.7),
                blurRadius: 10,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ]),
        child: const Center(
          child: Text("section",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.7),
                blurRadius: 10,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ]),
        child: const Center(
          child: Text("level",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.7),
                blurRadius: 10,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ]),
        child: const Center(
          child: Text("batch",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    ];
  }

  List<Container> getTeacherInfo() {
    return [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.7),
                blurRadius: 10,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ]),
        child: Center(
          child: Text("${hModel.teacher!.name!} ${hModel.teacher!.lastName!}",
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(40),
              height: 175,
              width: 175,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0,
                      color: Colors.white,
                      blurRadius: 10,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: Text(
                  type ? hModel.teacher!.name![0] : hModel.student!.name![0],
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 100,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(
                          MediaQuery.of(context).size.width, 100.0)),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            // ListView.separated(
                            //   separatorBuilder: (context, idx) => const Divider(),
                            itemBuilder: (context, idx) {
                              return type
                                  ? getTeacherInfo()[idx]
                                  : getStudentInfo()[idx];
                            },
                            scrollDirection: Axis.vertical,
                            itemCount: type
                                ? getTeacherInfo().length
                                : getStudentInfo().length,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ));
  }
}
