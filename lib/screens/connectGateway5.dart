import 'package:babysensornorwegian/components/appButton.dart';
import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/images.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:babysensornorwegian/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ConnectGateway5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(
          title: 'Set up: 1/3',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .07,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Well done!',
                  textAlign: TextAlign.center,
                  style: ComponentWise().objectTitle(AppColors.mainGreen),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Image.asset(
                AppImages.router,
                height: MediaQuery.of(context).size.height * .25,
                width: double.infinity,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Text(
                'The base station is connected to the Wi-Fi and ready to go.',
                textAlign: TextAlign.center,
                style: ComponentWise().description(AppColors.description),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: AppButton(
                    onPressed: () {},
                    loading: false,
                    text: "Connect sensors",
                    textColor: AppColors.white,
                    color: AppColors.secondaryColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
