import 'package:classtek/Models/news.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';

class NewsCard extends StatelessWidget {
  final NMessage nMessage;
  const NewsCard(this.nMessage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  scrollable: true,
                  title: Text(
                    "${nMessage.sender!.lastName!} ${nMessage.sender!.name!}",
                    style: const TextStyle(color: primaryColor),
                  ),
                  content: Column(
                    children: [
                      Text(
                        nMessage.object!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(nMessage.message!),
                      GestureDetector(
                        child: const Text("Attached file",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: primaryColor)),
                        onTap: () async {
                          var file = nMessage.fileUrl!;
                          if (!await launchUrl(
                            nMessage.fileUrl!,
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw 'Could not launch $file';
                          }
                        },
                      )
                    ],
                  ),
                  actions: [
                    RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: primaryColor,
                        child: const Text('Quit',
                            style: TextStyle(color: Colors.white)))
                  ],
                ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: 65,
        width: 153,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(nMessage.object!,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 13,
                    fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
