import 'package:babysensornorwegian/models/pageContent.dart';
import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/images.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> pageContent = [
  {
    'text': "1. Connect the base station plug to the power.",
    'image': AppImages.switchimage
  },
  {
    'text': "2. Connect the base station to your home Wi-Fi:",
    'image': null,
  },
  {
    'text':
        "2.1 Open Wi-Fi settings on your phone and connect to the BabySensor HotSpot network, then go back to the app.",
    'image': null,
  }
];

class FirstSetupListComponent extends StatefulWidget {
  FirstSetupListComponent({Key key, this.index}) : super(key: key);
  int index;

  @override
  _FirstSetupListComponentState createState() =>
      _FirstSetupListComponentState();
}

class _FirstSetupListComponentState extends State<FirstSetupListComponent> {
  List<PageContent> pagecontents = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pagecontents = pageContent.map((e) => PageContent.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pagecontents[widget.index].name,
            style: widget.index == 2
                ? ComponentWise().description(AppColors.lighterText)
                : ComponentWise().description(AppColors.lightText),
          ),
          if (pageContent[widget.index]['image'] != "")
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Image.asset(
                  pagecontents[widget.index].image,
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
