import 'package:babysensornorwegian/components/appButton.dart';
import 'package:babysensornorwegian/components/passwordformfield.dart';
import 'package:babysensornorwegian/getx/wifiNameController.dart';
import 'package:babysensornorwegian/screens/firstSetup.dart';
import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enterPassword(context) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return WifiPassword();
    },
  );
}

class WifiPassword extends StatefulWidget {
  WifiPassword({Key key}) : super(key: key);

  @override
  _WifiPasswordState createState() => _WifiPasswordState();
}

class _WifiPasswordState extends State<WifiPassword> {
  FocusNode focusNode;
  int textLength;
  bool valueGreater;
  String formData;
  final _formKey = GlobalKey<FormState>();
  final NameController nameController = Get.find<NameController>();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    focusNode.addListener(() => print('focusNode state ${focusNode.hasFocus}'));

    textLength = 0;
    valueGreater = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.95,
          decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                width: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Text(
                      "Password",
                      style: ComponentWise().appTitle(AppColors.lightDark),
                    ),
                    Positioned(
                      left: 0,
                      child: Center(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: ComponentWise()
                                .description(AppColors.mainGreen2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Enter the password for ',
                              style: ComponentWise()
                                  .description(AppColors.lightText)),
                          TextSpan(
                            text: '${nameController.name} ',
                            style:
                                ComponentWise().bodybold(AppColors.mainGreen),
                          ),
                          TextSpan(
                              text: 'network.',
                              style: ComponentWise()
                                  .description(AppColors.lightText)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Password",
                      style: focusNode.hasFocus
                          ? ComponentWise().bodySmall(AppColors.mainGreen)
                          : ComponentWise().bodySmall(AppColors.password),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 56,
                      child: CustomPasswordFormField(
                        onChanged: (value) {
                          setState(() {
                            textLength = value;
                            valueGreater = textLength > 0;
                          });
                        },
                        onVlaueSubmitted: (value) {
                          setState(() {
                            formData = value;
                          });
                        },
                        focusNode: focusNode,
                        hintText: 'Enter network password',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: AppButton(
                          onPressed: valueGreater
                              ? () {
                                  print("value of formdata $formData");
                                  if (_formKey.currentState.validate()) {
                                    if ((formData != null) && (formData != ""))
                                      Navigator.of(context).pop();
                                    Future.delayed(Duration(seconds: 0), () {
                                      Navigator.of(context).pushNamed(
                                          '/connectgateway5',
                                          arguments: {
                                            'childCurrent': FirstSetup()
                                          });
                                    });
                                  }
                                  // Navigation
                                }
                              : null,
                          loading: false,
                          text: "Connect",
                          textColor: valueGreater
                              ? AppColors.white
                              : AppColors.enabledbordertext,
                          color: valueGreater
                              ? AppColors.secondaryColor
                              : AppColors.enabledborder,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
