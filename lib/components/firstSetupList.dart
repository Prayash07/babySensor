import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/images.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> pageContent = [
  {
    'text': "1. Connect the base station plug to the power.",
    'image': AppImages.switchimage
  },
  {'text': "2. Connect the base station to your home Wi-Fi:", 'image': null},
  {
    'text':
        "2.1 Open Wi-Fi settings on your phone and connect to the BabySensor HotSpot network, then go back to the app.",
    'image': null
  }
];

class FirstSetupListComponent extends StatelessWidget {
  FirstSetupListComponent({Key key, this.index, this.pageContent})
      : super(key: key);
  List<Map<String, dynamic>> pageContent;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pageContent[index]['text'],
            style: index == 2
                ? ComponentWise().description(AppColors.lighterText)
                : ComponentWise().description(AppColors.lightText),
          ),
          if (pageContent[index]['image'] != null)
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Image.asset(
                  pageContent[index]['image'],
                  height: 134,
                  width: 201,
                ),
              ),
            )
        ],
      ),
    );
  }
}
