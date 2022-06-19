import 'package:classtek/Models/marks.dart';
import 'package:classtek/View_Models/marks_model_Views.dart';
import 'package:classtek/Views/marksCard.dart';
import 'package:classtek/constants/colors.dart';
import 'package:flutter/material.dart';

class Marks extends StatelessWidget {
  late MarksModelView model;
  Marks(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          title: const Text("Marks",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: Container(
            child: FutureBuilder<List<MarksMessage>>(
                future: model.getAllStudentMarks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  } else {
                    var marks = snapshot.data!;

                    if (marks.isNotEmpty) {
                      return ListView.builder(
                        itemBuilder: (context, idx) {
                          return MarksCard(marks[idx]);
                        },
                        scrollDirection: Axis.vertical,
                        itemCount: marks.length,
                      );
                    }
                    return Center(
                      child: Text("No Marks",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    );
                  }
                }),
          ))
        ]));
  }
}
