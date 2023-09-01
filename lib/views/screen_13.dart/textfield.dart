import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/media_query.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final double width;
  const TextFieldCustom(
      {required this.hintText, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: width,
        decoration: BoxDecoration(
            color: AppColors.appGreyBackground,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: TextField(
            style: TextStyle(color: AppColors.appBlackText),
            decoration: InputDecoration(
              hintText: hintText, // Placeholder text
              hintStyle: TextStyle(color: AppColors.appGreyText),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide.none, // No border when focused
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide.none, // No border when not focused
              ),
            ),
          ),
        ));
  }
}
