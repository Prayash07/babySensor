import 'package:babysensornorwegian/getx/wifiNameController.dart';
import 'package:babysensornorwegian/widgets/enterPassword.dart';
import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/icons.dart';
import 'package:babysensornorwegian/styles/theme.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

List availableWifi = [
  'Russel Family Wi-Fi',
  'Baker Wi-Fi',
  'My Wi-Fi',
];

class WifiNames extends StatelessWidget {
  WifiNames({Key key, this.index}) : super(key: key);
  int index;
  final NameController nameController = Get.find<NameController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nameController.setName(availableWifi[index]);
        Future.delayed(Duration(milliseconds: 100), () {
          enterPassword(context);
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
          color: AppTheme.lightThemeData.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.wifi,
              height: 20,
              width: 20,
              color: AppColors.mainGreen2,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              availableWifi[index],
              style: ComponentWise().description(AppColors.mainGreen2),
            )
          ],
        ),
      ),
    );
  }
}
