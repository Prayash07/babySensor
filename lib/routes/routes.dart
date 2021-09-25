import 'package:babysensornorwegian/screens/homePage.dart';
import 'package:babysensornorwegian/screens/signup.dart';
import 'package:babysensornorwegian/utils/pageTransition.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generator(RouteSettings settings) {
    Map<String, dynamic> arguments = settings.arguments ?? {};

    return PageTransition(
        duration: Duration(milliseconds: 200),
        child: routes(arguments)[settings.name],
        type: PageTransitionType.leftToRight);
  }
}

Map<String, Widget> routes(arguments) => {'/': SignUp()};
