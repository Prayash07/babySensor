import 'package:babysensornorwegian/components/appButton.dart';
import 'package:babysensornorwegian/components/integerFormField.dart';
import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:babysensornorwegian/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_library/flutter_network_library.dart';
import 'package:get/get.dart';

class FirstStepOfRegistration extends StatefulWidget {
  FirstStepOfRegistration({Key key}) : super(key: key);

  @override
  _FirstStepOfRegistrationState createState() =>
      _FirstStepOfRegistrationState();
}

class _FirstStepOfRegistrationState extends State<FirstStepOfRegistration> {
  FocusNode focusNode;

  int textLength;

  bool valueGreater;

  String formData;

  bool loading;

  final _formKey = GlobalKey<FormState>();

  RESTExecutor _data;

  postData(data) async {
    await _data.execute(data: data);
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    focusNode.addListener(() => print('focusNode state ${focusNode.hasFocus}'));

    textLength = 0;
    valueGreater = false;
    loading = false;

    _data = RESTExecutor(
        domain: 'register',
        label: 'sendsms',
        method: "POST",
        successCallback: (response) {
          setState(() {
            focusNode.unfocus();
            loading = false;
          });

          print('verification code ${response.data['verificationCode']}');

          Map<String, dynamic> finalData = {
            "number": formData,
            "verificationCode": response.data['verificationCode'],
            "userExistance": response.data['userExists'],
          };

          RESTExecutor(
            domain: 'persist',
            label: 'number',
            method: 'POST',
          )..execute(data: {"data": finalData});

          Navigator.of(context).pushNamed('/secondStepOfRegistration');
        },
        errorCallback: (data) {
          Get.snackbar(data.statusCode.toString(), data.rawData,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.secondaryColor,
              colorText: AppColors.white);
          setState(() {
            loading = false;
          });
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: IgnorePointer(
              ignoring: focusNode.hasFocus ? true : false,
              child: CustomAppBar(
                title: 'Register',
              ),
            ),
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Enter your valid phone number, you will receive a verification code.",
                          style:
                              ComponentWise().description(AppColors.lightText),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Phone number",
                          style: focusNode.hasFocus
                              ? ComponentWise().bodySmall(AppColors.mainGreen)
                              : ComponentWise().bodySmall(AppColors.password),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 56,
                          child: CustomIntegerFormField(
                            validator: (data) {
                              if (data == null ||
                                  data.isEmpty ||
                                  data.length < 10) {
                                return 'Enter your country code and number';
                              }
                              return null;
                            },
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
                            hintText: 'Enter phone number',
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
                                        if ((formData != null) &&
                                            (formData != "")) {
                                          setState(() {
                                            loading = true;
                                          });
                                          Map<String, dynamic> data = {
                                            "phoneNumber": formData.toString()
                                          };

                                          postData(data);
                                        }
                                      }
                                      // Navigation
                                    }
                                  : null,
                              loading: loading,
                              text: "Send Code",
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
          )),
    );
  }
}
