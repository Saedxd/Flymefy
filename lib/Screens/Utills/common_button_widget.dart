import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';

class CommonButtonWidget extends StatefulWidget {

  CommonButtonWidget({
    required this.onTap,
    required this.text,
    this.buttonColor = redCA0,
  
  });

  final VoidCallback onTap;
  final String text;
  final Color buttonColor;



  @override
  State<CommonButtonWidget> createState() => _CommonButtonWidgetState();
}

class _CommonButtonWidgetState extends State<CommonButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onTap,
      height: 50,
      minWidth: context.width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      color: widget.buttonColor,
      child: CommonTextWidget.PoppinsSemiBold(
        fontSize: 16,
        text: widget.text,
        color: white,
      ),
    );
  }
}
