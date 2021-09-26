import 'package:babysensornorwegian/styles/colors.dart';
import 'package:babysensornorwegian/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomIntegerFormField extends StatefulWidget {
  CustomIntegerFormField(
      {Key key,
      this.focusNode,
      this.hintText,
      this.onChanged,
      @required this.validator,
      this.onVlaueSubmitted})
      : super(key: key);
  FocusNode focusNode;
  String hintText;
  Function onChanged;
  Function onVlaueSubmitted;
  Function validator;

  @override
  _CustomIntegerFormFieldState createState() => _CustomIntegerFormFieldState();
}

class _CustomIntegerFormFieldState extends State<CustomIntegerFormField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.clear();
  }

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
        enabled: true,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
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
        validator: widget.validator);
  }
}
