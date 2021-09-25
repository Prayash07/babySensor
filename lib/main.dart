import 'package:babysensornorwegian/routes/routes.dart';
import 'package:babysensornorwegian/styles/theme.dart';
import 'package:babysensornorwegian/widgets/customError.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Sizer package for managing the layout sizes
    // ErrorWidget is built whenever there is any error in data (e.g. Text(null))
    // Navigated with named routing
    // Initialized Theme for the app

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BabySensor Norwegian',
          builder: (BuildContext context, Widget widget) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return Center(child: CustomError(errorDetails: errorDetails));
            };

            return widget;
          },
          theme: AppTheme.lightThemeData,
          onGenerateRoute: AppRoutes.generator,
        );
      });
    });
  }
}
