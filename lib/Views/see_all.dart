import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Schedule extends StatefulWidget {
  final cList;
  const Schedule(this.cList, {Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _NewsState(cList);
}

class _NewsState extends State<Schedule> {
  final cList;
  _NewsState(this.cList);
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
              child: ListView.builder(
                // ListView.separated(
                //   separatorBuilder: (context, idx) => const Divider(),
                itemBuilder: (context, idx) {
                  return cList[idx];
                },
                scrollDirection: Axis.vertical,
                itemCount: cList.length,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
