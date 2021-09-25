import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  final bool large;
  final Color color;

  CircularLoading({this.large = false, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: large ? 32 : 18,
      width: large ? 32 : 18,
      child: CircularProgressIndicator(
        strokeWidth: large ? 4 : 2,
        valueColor:
            AlwaysStoppedAnimation(color ?? Theme.of(context).primaryColor),
      ),
    );
  }
}
