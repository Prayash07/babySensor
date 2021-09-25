import 'package:babysensornorwegian/components/firstSetupList.dart';
import 'package:babysensornorwegian/components/wifiNames.dart';
import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/images.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/material.dart';

class FirstSetup extends StatefulWidget {
  FirstSetup({Key key}) : super(key: key);

  @override
  _FirstSetupState createState() => _FirstSetupState();
}

class _FirstSetupState extends State<FirstSetup> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  bool widgetVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    animation = Tween(begin: 0.0, end: 1.1).animate(_controller);

    timer();
  }

  timer() async {
    await Future.delayed(Duration(milliseconds: 800));
    setState(() {
      widgetVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          'Set up: 1/3',
          style: ComponentWise().appTitle(AppColors.lightDark),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Connect base station',
                  textAlign: TextAlign.center,
                  style: ComponentWise().objectTitle(AppColors.mainGreen),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                itemCount: pageContent.length,
                itemBuilder: (context, index) {
                  return FirstSetupListComponent(
                    index: index,
                    pageContent: pageContent,
                  );
                },
              ),
              widgetVisible
                  ? FadeTransition(
                      opacity: animation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              "2.2 Select your home Wi-Fi network.",
                              style: ComponentWise()
                                  .description(AppColors.lighterText),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: availableWifi.length,
                            itemBuilder: (context, index) {
                              return WifiNames(
                                index: index,
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
