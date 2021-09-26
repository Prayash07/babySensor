import 'package:babysensornorwegian/components/circularLoading.dart';
import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key key,
    this.title,
    this.action,
    this.loading = false,
    this.onActionPressed,
  }) : super(key: key);
  String title;
  bool action;
  bool loading;
  Function onActionPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: AppColors.mainGreen2,
              ),
              Text(
                "Back",
                style: ComponentWise().description(AppColors.mainGreen2),
              )
            ],
          ),
        ),
      ),
      actions: (action ?? false)
          ? [
              (loading ?? false)
                  ? FlatButton(
                      onPressed: null,
                      child: Text(
                        "Saving...",
                        style: ComponentWise()
                            .description(AppColors.secondaryColor),
                      ),
                    )
                  : FlatButton(
                      onPressed: onActionPressed ?? () {},
                      child: Text(
                        "Save",
                        style: ComponentWise()
                            .description(AppColors.secondaryColor),
                      ),
                    ),
            ]
          : [],
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      title: Text(
        title,
        style: ComponentWise().appTitle(AppColors.lightDark),
      ),
    );
  }
}
