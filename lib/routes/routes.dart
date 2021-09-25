import 'package:babysensornorwegian/screens/connectGateway5.dart';
import 'package:babysensornorwegian/screens/firstSetup.dart';
import 'package:babysensornorwegian/screens/homePage.dart';
import 'package:babysensornorwegian/screens/signup.dart';
import 'package:babysensornorwegian/utils/pageTransition.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generator(RouteSettings settings) {
    Map<String, dynamic> arguments = settings.arguments ?? {};

    if (settings.name == '/connectgateway5')
      return PageTransition(
          duration: Duration(milliseconds: 300),
          child: routes(arguments)[settings.name],
          childCurrent: arguments['childCurrent'] ?? Container(),
          type: PageTransitionType.rightToLeftJoined);

    return PageTransition(
        duration: Duration(milliseconds: 300),
        child: routes(arguments)[settings.name],
        type: PageTransitionType.rightToLeft);
  }
}

Map<String, Widget> routes(arguments) => {
      '/': SignUp(),
      '/firstSetup': FirstSetup(),
      '/connectgateway5': ConnectGateway5(),
    };
