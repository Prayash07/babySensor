import 'package:babysensornorwegian/components/integerFormField.dart';
import 'package:babysensornorwegian/components/textFormField.dart';
import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:babysensornorwegian/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_library/flutter_network_library.dart';

class SecondStepOfRegistration extends StatefulWidget {
  SecondStepOfRegistration({Key key}) : super(key: key);

  @override
  _SecondStepOfRegistrationState createState() =>
      _SecondStepOfRegistrationState();
}

class _SecondStepOfRegistrationState extends State<SecondStepOfRegistration> {
  FocusNode focusNode;
  FocusNode focusNodeforVerification;

  String formData;
  String verificationData;

  bool loading;

  final _formKey = GlobalKey<FormState>();

  RESTExecutor _data;
  RESTExecutor _persistor;

  // persistor
  String number;
  String verificationCode;
  bool userExistance;

  postData(data) async {
    await _data.execute(data: data);
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNodeforVerification = FocusNode();

    focusNode.addListener(() => print('focusNode state ${focusNode.hasFocus}'));
    focusNodeforVerification.addListener(
        () => print('focusNode state ${focusNodeforVerification.hasFocus}'));

    loading = false;

    _data = RESTExecutor(
        domain: 'register',
        label: 'confirmsms',
        method: "POST",
        successCallback: (data) {
          Navigator.of(context).pushNamed('/firstSetup');
          setState(() {
            loading = false;
          });
        },
        errorCallback: (data) {
          setState(() {
            loading = false;
          });
        });

    _persistor = RESTExecutor(
        domain: 'persist',
        label: 'number',
        method: "POST",
        successCallback: (data) {
          setState(() {
            loading = false;
          });
        });

    setState(() {
      number = _persistor.watch(context).data['data']['number'];
      verificationCode =
          _persistor.watch(context).data['data']['verificationCode'];
      userExistance = _persistor.watch(context).data['data']['userExistance'];
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
    focusNodeforVerification.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("number $number $verificationCode $userExistance");
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
        focusNodeforVerification.unfocus();
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(56),
              child: CustomAppBar(
                title: 'Register',
                action: true,
                loading: loading,
                onActionPressed: () {
                  setState(() {
                    loading = true;
                  });
                  if (_formKey.currentState.validate()) {
                    Map<String, dynamic> data = {
                      "verificationId":
                          verificationCode.toString(), // From 'send-sms-code'
                      "smsCode": verificationData
                          .toString(), // The sms code from the SMS.
                      "phoneNumber": number.toString(),
                      // Include the name optionally if you want to create a new user.
                      "name": formData.toString()
                    };
                    print('data $data');
                    _data.execute(data: data);
                  }
                },
              ),
            ),
            body: SingleChildScrollView(
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
                          "Enter your name and received verification code.",
                          style:
                              ComponentWise().description(AppColors.lightText),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Name",
                          style: focusNode.hasFocus
                              ? ComponentWise().bodySmall(AppColors.mainGreen)
                              : ComponentWise().bodySmall(AppColors.password),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 56,
                          child: CustomTextFormField(
                            onChanged: (value) {},
                            onVlaueSubmitted: (value) {
                              setState(() {
                                formData = value;
                                print(formData);
                              });
                            },
                            focusNode: focusNode,
                            hintText: 'Enter your name',
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      'You will receive the code in 60 sec. If you don’t receive it, ',
                                  style: ComponentWise()
                                      .description(AppColors.lighterText)),
                              TextSpan(
                                text: 'resend the code. ',
                                style: ComponentWise()
                                    .bodybold(AppColors.mainGreen),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 56,
                          child: CustomIntegerFormField(
                            validator: (data) {
                              if (data == null ||
                                  data.isEmpty ||
                                  data.length != 4) {
                                return 'The length should be equal to 4';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                            onVlaueSubmitted: (value) {
                              setState(() {
                                verificationData = value;
                              });
                            },
                            focusNode: focusNodeforVerification,
                            hintText: 'Enter verification code',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
