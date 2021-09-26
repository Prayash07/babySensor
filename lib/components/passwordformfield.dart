import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/material.dart';

class CustomPasswordFormField extends StatefulWidget {
  CustomPasswordFormField(
      {Key key,
      this.focusNode,
      this.hintText,
      this.onChanged,
      this.onVlaueSubmitted})
      : super(key: key);
  FocusNode focusNode;
  String hintText;
  Function onChanged;
  Function onVlaueSubmitted;

  @override
  _CustomPasswordFormFieldState createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: _controller,
      obscuringCharacter: "*",
      enabled: true,
      obscureText: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: ComponentWise().description(AppColors.enabledbordertext),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: AppColors.mainGreen, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: AppColors.enabledborder,
              width: 1.0,
            ),
          )),
      onChanged: (value) {
        widget.onChanged(_controller.text.length);
        widget.onVlaueSubmitted(_controller.text);
      },
      onFieldSubmitted: (term) {
        widget.onVlaueSubmitted(term);
        widget.focusNode.unfocus();
      },
      validator: (data) {
        if (data == null || data.isEmpty || data.length < 4) {
          return 'The length should be greater than 3';
        }
        return null;
      },
    );
  }
}
