import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/padding.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    Key key,
    @required this.errorDetails,
  })  : assert(errorDetails != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        child: Text("UI Component Error !",
            style: ComponentWise().cardHeader(AppColors.white)),
        padding: AppPadding.medium,
      ),
      color: Colors.red,
      margin: EdgeInsets.zero,
    );
  }
}
