import 'package:babysensornorwegian/components/circularLoading.dart';
import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color textColor;
  final bool loading;

  AppButton(
      {this.text = '',
      this.onPressed,
      this.textColor,
      this.color = AppColors.secondaryColor,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 56,
      child: CupertinoButton(
        onPressed: (loading ?? false) ? null : onPressed,
        pressedOpacity: 0.4,
        borderRadius: BorderRadius.circular(50),
        color: color ?? AppColors.secondaryColor,
        child: (loading ?? false)
            ? CircularLoading(color: AppColors.secondaryColor)
            : Text(
                text,
                style: ComponentWise().button(textColor),
              ),
      ),
    );
  }
}
