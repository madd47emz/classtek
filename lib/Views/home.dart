import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'newsCard.dart';
import 'schedulCell.dart';
import 'see_all.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<NewsCard> nList = [
    const NewsCard("CPC S2", "you will have it in 08/06"),
    const NewsCard("CPC S2", "you will have it in 08/06"),
    const NewsCard("CPC S2", "you will have it in 08/06"),
    const NewsCard("CPC S2", "you will have it in 08/06"),
    const NewsCard("CPC S2", "you will have it in 08/06"),
  ];
  final cList = [
    const Cell("Algorithms", "A10", 1, "8:00"),
    const Cell("Algorithms", "A10", 1, "8:00"),
    const Cell("Algorithms", "A10", 1, "8:00"),
    const Cell("Algorithms", "A10", 1, "8:00"),
    const Cell("Algorithms", "A10", 1, "8:00"),
    const Cell("Algorithms", "A10", 1, "8:00"),
    const Cell("Algorithms", "A10", 1, "8:00"),
  ];
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
            const Text("Welcome teacher!",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person, color: primaryColor))
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
              padding: EdgeInsets.fromLTRB(30, 30, 0, 20),
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
              child: ListView.builder(
                // ListView.separated(
                //   separatorBuilder: (context, idx) => const Divider(),
                itemBuilder: (context, idx) {
                  return nList[idx];
                },
                scrollDirection: Axis.horizontal,
                itemCount: nList.length,
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
                            Text("Today's schedule",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700)),
                            GestureDetector(
                              onTap: (() => setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Schedule(cList)));
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
            ),
          ],
        ),
      ),
    );
  }
}
