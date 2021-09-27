import 'package:babysensornorwegian/components/appButton.dart';
import 'package:babysensornorwegian/getx/wifiNameController.dart';
import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/icons.dart';
import 'package:babysensornorwegian/styles/images.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final NameController nameController = Get.put(NameController());

  Map<String, dynamic> loading = {
    'signup': false,
    'signin': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                Image.asset(
                  AppImages.clouds,
                  height: MediaQuery.of(context).size.height * .25,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                SvgPicture.asset(AppIcons.logo),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Monitor your baby's condition in real time and connect instantly with the health visitors.",
                    textAlign: TextAlign.center,
                    style: ComponentWise().description(AppColors.description),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: AppButton(
                        onPressed: () {
                          setState(() {
                            loading['signup'] = true;
                          });
                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.of(context).pushNamed(
                              '/firstStepOfRegistration',
                            );
                            setState(() {
                              loading['signup'] = false;
                            });
                          });
                        },
                        loading: loading['signup'],
                        text: "Sign up",
                        textColor: AppColors.white,
                        color: AppColors.secondaryColor,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              width: 1, color: AppColors.secondaryColor)),
                      child: AppButton(
                        onPressed: () {
                          setState(() {
                            loading['signin'] = true;
                          });
                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.of(context).pushNamed(
                              '/firstStepOfRegistration',
                            );
                            setState(() {
                              loading['signin'] = false;
                            });
                          });
                        },
                        loading: loading['signin'],
                        text: "Sign in",
                        textColor: AppColors.secondaryColor,
                        color: AppColors.white,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
